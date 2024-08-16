import 'dart:convert';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/domain/models/workout_plans/model.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

// class WorkoutPlansFetchRepo {
//   static Future<List<WorkoutPlanModel>> fetchWorkoutPlans() async {
//     final response = await http.get(Uri.parse(Apis.workoutFetch));
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonData = json.decode(response.body);

//       print(jsonData['plans'][0]['plan_name']);
//       List<dynamic> plansJson = jsonData['plans'];
//       List<WorkoutPlanModel> workoutPlans =
//           plansJson.map((json) => WorkoutPlanModel.fromJson(json)).toList();
//       return workoutPlans;
//     } else {
//       throw Exception('Failed to load workout plans');
//     }
//   }
// }

class WorkoutPlansFetchRepo {
  static Future<List<WorkoutPlanModel>> fetchWorkoutPlans() async {
    final response = await http.get(
      Uri.parse(Apis.workoutFetch),
      headers: {
        'Authorization': 'Bearer $accesstocken',
      },
    );
    print(response.body);
    print('=======================================');
    print('=======================================');
    print('=======================================');
    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);

        print(jsonData['plans'][0]['plan_name']);
        List<dynamic> plansJson = jsonData['plans'];
        List<WorkoutPlanModel> workoutPlans =
            plansJson.map((json) => WorkoutPlanModel.fromJson(json)).toList();
        print("==================================>>>>>>>>>");
        return workoutPlans;
      } else {
        throw Exception('Failed to load workout plans');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
