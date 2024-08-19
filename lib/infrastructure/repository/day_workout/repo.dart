import 'dart:convert';

import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/domain/models/exercise_fetch/model.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class DayWorkoutRepo {
  static Future<List<List<ExerciseSubClass>>> dayworkout(
      String workoutId) async {
    try {
      final response = await http.get(
        Uri.parse('${Apis.baseUrl}/plan/day/$workoutId/exercises'),
        headers: {
          'Authorization': 'Bearer $accesstocken',
        },
      );
      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        // Create three lists to store the ExerciseSubClass objects
        List<ExerciseSubClass> exercisesList = [];
        List<ExerciseSubClass> supersetList = [];
        List<ExerciseSubClass> circuitList = [];

        // Check if exercises data is present and add to the list
        if (jsonData['exercises'] != null) {
          exercisesList = List<ExerciseSubClass>.from(
            jsonData['exercises']
                .map((exercise) => ExerciseSubClass.fromJson(exercise)),
          );
        }

        // Check if superset data is present and add to the list
        if (jsonData['superset'] != null) {
          supersetList = List<ExerciseSubClass>.from(
            jsonData['superset']
                .map((superset) => ExerciseSubClass.fromJson(superset)),
          );
        }

        // Check if circuit data is present and add to the list
        if (jsonData['circuit'] != null) {
          circuitList = List<ExerciseSubClass>.from(
            jsonData['circuit']
                .map((circuit) => ExerciseSubClass.fromJson(circuit)),
          );
        }

        // Return the three lists
        print(jsonDecode(response.body));

        return [exercisesList, supersetList, circuitList];
      } else {
        throw Exception('Failed to load exercises');
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
