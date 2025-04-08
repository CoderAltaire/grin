import 'dart:convert';
export 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:grin/core/api/main_app/api_service.dart';
import 'package:grin/core/api/main_app/http_inspector.dart';
import 'package:grin/core/api/main_app/http_result.dart';
import 'package:grin/core/api/main_app/list_api.dart';
import 'package:grin/core/utils/log_service.dart';
import 'package:http/http.dart' as http;

const bool isDev = false;

class ApiService {
  ApiService._();
  static const String _baseUrl =
      isDev ? "http://161.97.140.68:3000/" : "http://161.97.140.68:3000/";

  static final token = "";

  static Map<String, String> _header() {
    if (token.isEmpty) {
      return {
        "Content-Type": "application/json",
      };
    }
    return {
      "Content-Type": "application/json",
      "Authorization": 'Bearer ${token}'
    };
  }

  static Map<String, String> _header2() {
    return {
      "Content-Type": "application/json",
    };
  }

  //=====LOGIN=====
  static Future<HttpResult> login(String phone, String password) async {
    var body = {
      "phonenumber": phone,
      "password": password,
    };

    return await _post(ListAPI.login, body: body);
  }

  static Future<HttpResult> _post(
    String path, {
    Object? body,
    bool? isSecondHeader = false,
  }) async {
    Uri url = Uri.parse('$_baseUrl$path');
    try {
      http.Response response = await http
          .post(
            url,
            body: jsonEncode(body),
            headers: isSecondHeader == true ? _header2() : _header(),
          )
          .timeout(const Duration(seconds: 30));

      HttpInspector.onResponse(response);

      var decoded = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return HttpResult(
          statusCode: response.statusCode,
          isSuccess: true,
          result: decoded,
        );
      }

      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }

      return HttpResult(
        statusCode: response.statusCode,
        // result: decoded['message'].toString(),
        result: decoded.toString(),

        path: path,
      );
    } catch (err) {
      return HttpResult(
        statusCode: -1,
        result: err,
        path: path,
      );
    }
  }

  static Future<HttpResult> _get(
    String path,
  ) async {
    Uri url;
    url = Uri.parse('$_baseUrl$path');
    try {
      http.Response response = await http
          .get(
            url,
            headers: _header(),
          )
          .timeout(const Duration(seconds: 30));
      HttpInspector.onResponse(response);

      var decoded = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        return HttpResult(
          statusCode: 200,
          isSuccess: true,
          result: decoded,
        );
      }
      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }
      return HttpResult(
        statusCode: response.statusCode,
        // result: decoded['message'].toString(),
        result: decoded.toString(),
        path: path,
        method: 'GET',
      );
    } catch (err) {
      return HttpResult(
        statusCode: -1,
        result: err,
        path: path,
        method: 'GET',
      );
    }
  }

  static Future<HttpResult> _getWithoutBaseUrl(String path) async {
    Uri url = Uri.parse(path);
    try {
      http.Response response = await http
          .get(
            url,
            headers: _header(),
          )
          .timeout(const Duration(seconds: 30));
      HttpInspector.onResponse(response);
      var decoded = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return HttpResult(
          statusCode: 200,
          isSuccess: true,
          result: decoded,
        );
      }
      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }
      return HttpResult(
        statusCode: response.statusCode,
        result: decoded['message'].toString(),
        path: path,
        method: 'GET',
      );
    } catch (err) {
      return HttpResult(
        statusCode: -1,
        result: err,
        path: path,
        method: 'GET',
      );
    }
  }

  static Future<HttpResult> _patch(String path, {Object? body}) async {
    Uri url = Uri.parse('$_baseUrl$path');

    try {
      http.Response response = await http
          .patch(
            url,
            body: jsonEncode(body),
            headers: _header(),
          )
          .timeout(const Duration(seconds: 30));
      HttpInspector.onResponse(response);
      var decoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return HttpResult(
          statusCode: 200,
          isSuccess: true,
          result: decoded,
          method: 'PATCH',
          path: path,
        );
      }
      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }
      return HttpResult(
        statusCode: response.statusCode,
        result: decoded['message'].toString(),
        method: 'PATCH',
        path: path,
      );
    } catch (err) {
      return HttpResult(
        statusCode: -1,
        result: err,
        method: 'PATCH',
        path: path,
      );
    }
  }

  static Future<HttpResult> uploadImage(
    String path, {
    required List<Uint8List> imgPaths,
    String method = 'POST',
    String field = 'file',
  }) async {
    Uri url = Uri.parse('$_baseUrl$path');
    try {
      var request = http.MultipartRequest(method, url);
      List<http.MultipartFile> files = [];

      for (var imagePath in imgPaths) {
        http.MultipartFile file = http.MultipartFile.fromBytes(
          field,
          imagePath,
          filename: 'img.png',
          contentType: MediaType('image', 'png'),
        );
        files.add(file);
      }
      request.files.addAll(files);
      request.headers.addAll(_header());
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      // HttpInspector.onResponse(response);
      int statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        return HttpResult(
          statusCode: statusCode,
          result: response.body,
          isSuccess: true,
        );
      }
      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }
      return HttpResult(statusCode: statusCode, result: response.body);
    } catch (e) {
      return HttpResult(statusCode: -1, result: e);
    }
  }
}

class AppStrings2 {
  static const String INVALID_RESPONSE = 'Неверный ответ';
  static const String SOCKET_EXCEPTION = 'Нет соединения с интернетом';
  static const String FORMAT_ERROR = 'Неверный формат';
  static const String UNKNOWN_ERROR = 'Неизвестная ошибка';
  static const String TIMEOUT_EXCEPTION = 'Исключение тайм-аута';
  static const String HTTP_ERROR = 'HTTP-ошибка';
}
