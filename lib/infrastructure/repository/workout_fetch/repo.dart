import 'dart:convert';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/domain/models/workout_model/model.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class WorkoutRepository {
  // Future<List<WorkoutFetchModel>> fetchWorkouts() async {
  //   final response = await http.get(Uri.parse(Apis.workoutsFetch));

  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     List<WorkoutFetchModel> workouts = List<WorkoutFetchModel>.from(
  //       jsonData['workout']
  //           .map((workout) => WorkoutFetchModel.fromJson(workout)),
  //     );
  //     print('=============workouts========================');
  //     print(response.body);
  //     print('=======================workout==================');
  //     return workouts;
  //   } else {
  //     throw Exception('Failed to load workouts');
  //   }
  // }
  Future<List<WorkoutFetchModel>> fetchWorkouts() async {
    final response = await http.get(
      Uri.parse(Apis.workoutsFetch),
      headers: {
        'Authorization': 'Bearer $accesstocken',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<WorkoutFetchModel> workouts = List<WorkoutFetchModel>.from(
        jsonData['workout']
            .map((workout) => WorkoutFetchModel.fromJson(workout)),
      );

      return workouts;
    } else {
      print('Failed to load workouts: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load workouts');
    }
  }
}
