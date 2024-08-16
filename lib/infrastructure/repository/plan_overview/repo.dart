import 'dart:convert';
import 'package:fit_pro/domain/models/plan_overview/model.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class PlanOverViewRepo {
  static Future<List<PlanOverviewModel>> fetchWorkoutPlans(
      String planId) async {
    final response = await http.get(
      Uri.parse("http://13.60.105.223/api/v1/plan/fetch?planID=$planId"),
      headers: {
        'Authorization': 'Bearer $accesstocken',
      },
    );
    // print('http://13.60.105.223/api/v1/plan/fetch?planID=$planId');
    // print(accesstocken);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData;
      try {
        jsonData = json.decode(response.body) as Map<String, dynamic>;
      } catch (e) {
        throw Exception('Failed to decode JSON');
      }

      if (jsonData.containsKey('plans') && jsonData['plans'] is List) {
        List<dynamic> plansJson = jsonData['plans'] as List<dynamic>;
        List<PlanOverviewModel> workoutPlans = plansJson
            .map((json) =>
                PlanOverviewModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return workoutPlans;
      } else {
        throw Exception('Unexpected JSON format: ${jsonData['plans']}');
      }
    } else {
      throw Exception('Failed to load workout plans');
    }
  }
}
