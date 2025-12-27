import 'dart:convert';
import '../core/network/api_client.dart';

class CareGiverService {
  static Future<List<dynamic>> getAssignedTasks() async {
    final response = await ApiClient.get('/caregiver/tasks');

    if (response.statusCode != 200) {
      throw Exception('Failed to load tasks');
    }

    return jsonDecode(response.body);
  }
}
