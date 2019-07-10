import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static final NetworkUtil _instance = new NetworkUtil.internal();
  static String apiBaseUrl;

  NetworkUtil.internal();
  factory NetworkUtil(String apiUrl) {
    apiBaseUrl = apiUrl;
    return _instance;
  }

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String resourcePath,
      [Map<String, String> queryParameters]) async {
    final uri = _buildUri(resourcePath, queryParameters);
    final response = await http.get(uri);
    final String res = response.body;
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return _decoder.convert(res);
  }

  Future<dynamic> post(String resourcePath,
      {Map headers, body, encoding}) async {
    final uri = _buildUri(resourcePath);
    final response =
        await http.post(uri, body: body, headers: headers, encoding: encoding);
    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return _decoder.convert(res);
  }

  Uri _buildUri(String resourcePath, [Map<String, String> queryParameters]) {
    return Uri.parse('$apiBaseUrl/$resourcePath')
      ..replace(queryParameters: queryParameters);
  }
}

enum HttpError {
  Unauthorized,
  BadRequest,
  NotFound,
  Forbidden,
  InternalServerError
}
