import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:grin/core/api/main_app/dio_interceptor.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient  {
  String? vBaseUrl;
  late Dio _dio;
  String? tokenn = "";

  DioClient(SharedPreferences preferences) {
    vBaseUrl = preferences.getString(V_BASE_URL);
    tokenn = preferences.getString(V_BASE_URL);

    _dio = _createDio();
    try {
      _dio.interceptors.add(MySmartDioInterceptor(preferences));
    } catch (e) {
      debugPrint('SE:$e');
    }
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
    }
  }
  Dio get dio {
    final dio = _createDio();

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true, requestBody: true, requestHeader: true));
    }
    return dio;
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: vBaseUrl ?? BASE_URL,
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          validateStatus: (int? status) {
            return status! > 0 && status != 401;
            // return status != null && status >= 200 && status < 300;
          },
        ),
      );

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return response;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String url) async {
    try {
      final response = await _dio.delete(url);
      if (response.statusCode == 204) {
        return true;
      }
      return response.data;
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? headers,
    dynamic data,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: options ?? Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final response =
          await _dio.patch(url, data: data, options: Options(headers: headers));
      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return response;
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final response =
          await _dio.put(url, data: data, options: Options(headers: headers));
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return response;
    } on DioException catch (e) {
      rethrow;
    }
  }
}

// import 'package:bir_qadam/core/api/main_app/dio_interceptor.dart';
// import 'package:bir_qadam/core/constants/constants.dart';
// import 'package:bir_qadam/core/service/main_box/main_box_service.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// typedef ResponseConverter<T> = T Function(dynamic response);

// class DioClient with MainBoxMixin {
//   String? vBaseUrl;
//   late Dio _dio;
//   late SharedPreferences _preferences;

//   DioClient(SharedPreferences preferences) {
//     _preferences = preferences;
//     vBaseUrl = preferences.getString(V_BASE_URL);
//     _dio = _createDio();

//     // Interceptorlarni qo'shish
//     _dio.interceptors.add(MySmartDioInterceptor(preferences));
//     _dio.interceptors.add(_createInterceptor());

//     if (kDebugMode) {
//       _dio.interceptors.add(LogInterceptor(
//         responseBody: true,
//         requestBody: true,
//       ));
//     }
//   }

//   Dio _createDio() => Dio(
//         BaseOptions(
//           baseUrl: vBaseUrl ?? BASE_URL,
//           receiveTimeout: const Duration(seconds: 30),
//           connectTimeout: const Duration(seconds: 30),
//           validateStatus: (int? status) {
//             return status! > 0;
//           },
//         ),
//       );

//   InterceptorsWrapper _createInterceptor() {
//     return InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         // Access tokenni sozlash
//         final accessToken = _preferences.getString(ACCESS_TOKEN);
//         if (accessToken != null) {
//           options.headers['Authorization'] = 'Bearer $accessToken';
//         }
//         return handler.next(options);
//       },
//       onError: (error, handler) async {
//         // Token muddati tugagan bo'lsa
//         if (error.response?.statusCode == 401) {
//           final isRefreshed = await _refreshToken();
//           if (isRefreshed) {
//             // So'rovni qayta yuborish
//             final retryResponse = await _dio.request(
//               error.requestOptions.path,
//               options: Options(
//                 method: error.requestOptions.method,
//                 headers: error.requestOptions.headers,
//               ),
//               data: error.requestOptions.data,
//               queryParameters: error.requestOptions.queryParameters,
//             );
//             return handler.resolve(retryResponse);
//           }
//         }
//         return handler.next(error);
//       },
//     );
//   }

//   Future<bool> _refreshToken() async {
//     try {
//       final refreshToken = _preferences.getString(REFRESH_TOKEN);
//       if (refreshToken == null) return false;
//       String url = vBaseUrl ?? BASE_URL;
//       final response = await Dio().post(
//         '${url}token/refresh',
//         data: {'refresh': refreshToken},
//       );

//       if (response.statusCode == 200) {
//         final newAccessToken = response.data['access_token'];
//         final newRefreshToken = response.data['refresh_token'];

//         // Yangi tokenlarni saqlash
//         await _preferences.setString(ACCESS_TOKEN, newAccessToken);
//         await _preferences.setString(REFRESH_TOKEN, newRefreshToken);
//         return true;
//       }
//     } catch (e) {
//       debugPrint("Tokenni yangilashda xatolik: $e");
//     }
//     return false;
//   }

//   // CRUD funksiyalari
//   Future<dynamic> get(
//     String url, {
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final response = await _dio.get(url, queryParameters: queryParameters);
//       if (response.statusCode != 200) {
//         throw DioException(
//           requestOptions: response.requestOptions,
//           response: response,
//         );
//       }
//       return response;
//     } on DioException catch (e) {
//       rethrow;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> post(
//     String url, {
//     Map<String, dynamic>? headers,
//     dynamic data,
//     Options? options,
//   }) async {
//     try {
//       final response = await _dio.post(
//         url,
//         data: data,
//         options: options ?? Options(headers: headers),
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return response;
//       } else {
//         throw DioException(
//           requestOptions: response.requestOptions,
//           response: response,
//         );
//       }
//     } on DioException catch (e) {
//       rethrow;
//     }
//   }
//   // Qolgan funksiyalar o'sha holatda qoladi (delete, patch, put)
// }
