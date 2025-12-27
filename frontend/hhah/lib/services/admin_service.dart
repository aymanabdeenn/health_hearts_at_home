import 'dart:convert';
import '../core/network/api_client.dart';

class AdminService {
  static Future<void> createResource({
    required String title,
    required String language,
    required String type,
    required String category,
    required String link,
  }) async {
    final response = await ApiClient.post(
      '/admin/addResource',
      body: {
        'title': title,
        'language': language,
        'type': type,
        'category': category,
        'link': link,
      },
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to create resource');
    }
  }
}
