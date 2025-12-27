import 'dart:convert';
import 'package:http/http.dart' as http;
import '../storage/secure_storage.dart';

class ApiClient {
  static const String baseUrl = 'http://10.0.2.2:8080';

  static Future<http.Response> get(String endpoint) async {
    return _sendRequest('GET', endpoint);
  }

  static Future<http.Response> post(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    return _sendRequest('POST', endpoint, body: body);
  }

  static Future<http.Response> _sendRequest(
    String method,
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    final token = await SecureStorage.getToken();

    final uri = Uri.parse('$baseUrl$endpoint');
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    late http.Response response;

    switch (method) {
      case 'GET':
        response = await http.get(uri, headers: headers);
        break;
      case 'POST':
        response = await http.post(
          uri,
          headers: headers,
          body: body != null ? jsonEncode(body) : null,
        );
        break;
      default:
        throw Exception('HTTP method not supported');
    }

    if (response.statusCode == 401) {
      await SecureStorage.clearAll();
      throw Exception('Unauthorized – please login again');
    }

    return response;
  }
}
