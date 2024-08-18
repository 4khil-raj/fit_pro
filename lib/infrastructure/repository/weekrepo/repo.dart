import 'dart:convert';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/domain/models/weeksmodel/model.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class WeekFetchRepo {
  static Future<List<WeekModel>> fetchWeek(String weekId) async {
    final response = await http.get(
      Uri.parse("${Apis.baseUrl}/plan/week/$weekId"),
      headers: {
        'Authorization': 'Bearer $accesstocken',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData;
      try {
        jsonData = json.decode(response.body) as Map<String, dynamic>;
      } catch (e) {
        print('Error decoding JSON: $e');
        throw Exception('Failed to decode JSON');
      }

      print('Parsed JSON data: $jsonData');

      // Adjust this condition to check for a Map instead of List
      if (jsonData.containsKey('week') && jsonData['week'] is Map) {
        Map<String, dynamic> weekJson =
            jsonData['week'] as Map<String, dynamic>;
        WeekModel week = WeekModel.fromJson(weekJson);
        print([week]);
        return [week]; // Wrap the single WeekModel in a list
      } else {
        throw Exception('Unexpected JSON format: ${jsonData['week']}');
      }
    } else {
      throw Exception('Failed to load week');
    }
  }
}
