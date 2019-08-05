import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static final NetworkUtil _instance = new NetworkUtil.internal();
  static String apiBaseUrl;
  final JsonDecoder _decoder = new JsonDecoder();

  //TODO: store token in securise location
  String _token = "";

  NetworkUtil.internal();
  factory NetworkUtil(String apiUrl) {
    apiBaseUrl = apiUrl;
    return _instance;
  }

  Future<dynamic> get(String resourcePath,
      [Map<String, String> queryParameters,
      bool isAuthenticated = false]) async {
    try {
      final headers = {"Authorization": "Bearer $_token"};
      final uri = _buildUri(resourcePath, queryParameters);
      final response = _token.isNotEmpty && isAuthenticated
          ? await http.get(uri, headers: headers)
          : await http.get(uri);
      refreshToken(response);
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode >= 400) throw HttpException(statusCode);
      return _decoder.convert(res);
    } catch (exception) {
      return Future.error(exception);
    }
  }

  Future<dynamic> post(String resourcePath,
      {Map headers,
      Map body,
      Encoding encoding,
      bool isAuthentificated = true}) async {
    try {
      if (_token.isNotEmpty) {
        headers["Authorization"] = "Bearer $_token";
      }
      final uri = _buildUri(resourcePath);
      final response = await http.post(uri,
          body: body, headers: headers, encoding: encoding);
      refreshToken(response);
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode >= 400) throw HttpException(statusCode);
      return _decoder.convert(res);
    } catch (exception) {
      return Future.error(exception);
    }
  }

  Future<dynamic> put(String resourcePath,
      {Map headers,
      Map body,
      Encoding encoding,
      bool isAuthentificated = true}) async {
    try {
      if (_token.isNotEmpty) {
        headers["Authorization"] = "Bearer $_token";
      }
      final uri = _buildUri(resourcePath);
      final response =
          await http.put(uri, body: body, headers: headers, encoding: encoding);
      refreshToken(response);
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode >= 400) throw HttpException(statusCode);
      return _decoder.convert(res);
    } catch (exception) {
      return Future.error(exception);
    }
  }

  Uri _buildUri(String resourcePath, [Map<String, String> queryParameters]) {
    return Uri.parse('$apiBaseUrl/$resourcePath')
      ..replace(queryParameters: queryParameters);
  }

  void resetToken() {
    _token = "";
  }

  void refreshToken(http.Response response) {
    final newToken = response.headers["Authorization"];
    if (newToken?.isNotEmpty ?? false) {
      _token = newToken;
    }
  }
}

enum HttpStatusError {
  UnAuthorized,
  BadRequest,
  Forbidden,
  NotFound,
  InternalServerError,
  Unknown
}

class HttpException implements Exception {
  HttpStatusError status;
  String message;
  HttpException(int statusCode) {
    switch (statusCode) {
      case 400:
        this.status = HttpStatusError.BadRequest;
        this.message = "Bad request";
        break;
      case 401:
        this.status = HttpStatusError.UnAuthorized;
        this.message = "UnAuthorized access ";
        break;
      case 403:
        this.status = HttpStatusError.Forbidden;
        this.message = "Resource access forbidden";
        break;
      case 404:
        this.status = HttpStatusError.NotFound;
        this.message = "Resource not Found";
        break;
      case 500:
        this.status = HttpStatusError.InternalServerError;
        this.message = "Internal server error";
        break;
      default:
        this.status = HttpStatusError.Unknown;
        this.message = "Unknown";
        break;
    }
  }
  String toString() {
    if (message == null) return "Exception";
    return message;
  }
}
