import 'dart:convert';

import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class DayWorkoutRepo {
  static dayworkout(String workoutId) async {
    try {
      final response = await http.get(
        Uri.parse('${Apis.baseUrl}/plan/day/$workoutId/exercises'),
        headers: {
          'Authorization': 'Bearer $accesstocken',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        return jsonData['data'];
      } else {
        throw Exception('Failed to load exercises');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
