import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../core/network/api_client.dart';
import '../core/storage/secure_storage.dart';

class AuthService {
  static Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('${ApiClient.baseUrl}/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception('Invalid credentials: ${response.body}');
    }

    final data = jsonDecode(response.body);
    final token = data['accessToken'];
    final role = data['role'];

    await SecureStorage.saveToken(token);
    await SecureStorage.saveRole(role);

    return role;
  }

  static Future<void> logout() async {
    await SecureStorage.clearAll();
  }

  static Future<void> signUp({
    required String name,
    required String childName,
    required String username,
    required String password,
    required String phone,
    required String email,
    required String userType,
  }) async {
    final response = await http.post(
      Uri.parse('${ApiClient.baseUrl}/auth/signUp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userType': userType,
        'name': name,
        'childName': childName,
        'username': username,
        'password': password,
        'phoneNumber': phone,
        'email': email,
      }),
    );

    debugPrint('Signup response status: ${response.statusCode}');
    debugPrint('Signup response body: ${response.body}');

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to create account: ${response.body}');
    }
  }
}
