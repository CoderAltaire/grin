import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MySmartDioInterceptor extends Interceptor {
  MySmartDioInterceptor(this._preferences);
  final SharedPreferences _preferences;

  String _token = '';
  String _lang = '';

  List<Map<String, dynamic>> _failedRequests = [];
  bool _isRefreshing = false;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    _token = _preferences.getString(ACCESS_TOKEN) ?? "";
    _lang = _preferences.getString(APP_LANGUAGE) ?? "";
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers["Accept-Language"] = _lang;

    if (_token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $_token";
    }
    debugPrint('REQUEST::${options.data}');
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && _token.isNotEmpty) {
      if (_isRefreshing == false) {
        _isRefreshing = true;
        try {
          final success = await _refreshToken();
          if (success) {
            await _retryFailedRequests();
          } else {
            handler.reject(err);
          }
        } catch (e) {
          handler.reject(err); // agar xatolik bo'lsa
        } finally {
          _isRefreshing = false; // always reset the flag
        }
      } else {
        // token yangilanishi davomida boshqa so'rovlar kutmoqda, shuning uchun xatolikni saqlab qolamiz
        _failedRequests.add({'err': err, 'handler': handler});
        return;
      }
    } else if (_shouldRetry(err)) {
      // Internet ulanmagan holatda qayta urinib ko'rish
      handler.reject(err);
    } else {
      handler.next(err);
    }
  }

  /// Tokenni yangilash
  Future<bool> _refreshToken() async {
    try {
      final refreshToken = _preferences.getString(REFRESH_TOKEN) ?? '';
      if (refreshToken.isEmpty) return false;
      final response = await Dio().post(
        '${BASE_URL}token/refresh/',
        data: {'refresh': refreshToken},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            // 'Authorization':
            //     'Bearer $refreshToken', // Refresh tokenni headerga qo'shish
          },
          validateStatus: (status) => status! > 0,
        ),
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['access'];
        final newRefreshToken = response.data['refresh'];
        // Yangi tokenlarni saqlash
        await _preferences.setString(ACCESS_TOKEN, newAccessToken);
        await _preferences.setString(REFRESH_TOKEN, newRefreshToken);
        _token = newAccessToken;
        return true;
      }
      if (response.statusCode == 401) {
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // await navigatorKey.currentState!.context.read<AuthCubit>().logout();
        // await navigatorKey.currentState!.context
        //     .read<AuthCubit>()
        //     .checkUserToAuth();
        // await navigatorKey.currentState!.context
        //     .read<BasketCubit>()
        //     .clearBasket();
        // pref.setString(CURRENT_USER_VERSION, "");
        // NotificationCount.updateBadgeCount(0);
        // Navigator.pop(navigatorKey.currentState!.context);
        // var bloc = navigatorKey.currentState!.context.read<MainTabCubit>();
        // await bloc.isMainTab(0);
        // Navigator.pushNamedAndRemoveUntil(navigatorKey.currentState!.context,
        //     AppRoutes.waitingScreen, (route) => false);

        return true;
      }
    } catch (e) {
      debugPrint('Tokenni yangilashda xatolik: $e');
    }
    return false;
  }

  /// Token muvaffaqiyatli yangilanganidan so'ng so'rovlarni qayta urinish
  Future<void> _retryFailedRequests() async {
    for (final request in _failedRequests) {
      try {
        final options = Options(
          method: request['err'].requestOptions.method,
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
          validateStatus: (status) => status! > 0 && status != 401,
        );

        final response = await Dio().request(
          request['err'].requestOptions.path,
          options: options,
          data: request['err'].requestOptions.data,
          queryParameters: request['err'].requestOptions.queryParameters,
        );

        if (!request['handler'].isResolved) {
          // check if handler has already been resolved

          request['handler'].resolve(response);
        }
      } catch (e) {
        if (!request['handler'].isResolved) {
          // check if handler has already been resolved

          request['handler'].reject(e as DioException);
        }
      }
    }

    // _failedRequests.clear();
  }

  bool _shouldRetry(DioException err) {
    return err.error != null && err.error is SocketException;
  }
}
