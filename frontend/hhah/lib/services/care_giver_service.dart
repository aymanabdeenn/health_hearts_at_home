import 'dart:convert';
import 'package:hhah/core/network/api_client.dart';
import 'package:hhah/models/resource-model.dart';

class CareGiverService {
  static Future<List<ResourceModel>> getResourcesViaLanguageAndCategory({
    required String language,
    required String category,
  }) async {
    final response = await ApiClient.post(
      '/caregiver/getResources',
      body: {'language': language, 'category': category},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get resources');
    }

    final List data = jsonDecode(response.body);
    return data.map((e) => ResourceModel.fromJson(e)).toList();
  }
}
