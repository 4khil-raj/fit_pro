// import 'dart:convert';
// import 'package:fit_pro/domain/models/exercise_fetch/model.dart';
// import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
// import 'package:http/http.dart' as http;

// class ExerciseFetchRepo {
//   static Future<List<ExerciseFetchModel>> fetchExercises(
//       String workoutId) async {
//     final response = await http.get(
//       Uri.parse('http://13.60.105.223/api/v1/workouts/$workoutId/exercises'),
//       headers: {
//         'Authorization': 'Bearer $accesstocken',
//       },
//     );

//     print(response.body);
//     print('http://13.60.105.223/api/v1/workouts/$workoutId/exercises');

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonData = json.decode(response.body);

//       // Create a list to store the ExerciseFetchModel objects
//       List<ExerciseFetchModel> list = [];
//       List<ExerciseSubClass> superSet = [];

//       // Check if exercises data is present and add to the list
//       if (jsonData['exercises'] != null) {
//         list.add(
//           ExerciseFetchModel(
//             status: jsonData['status'],
//             message: jsonData['message'],
//             exercises: List<ExerciseSubClass>.from(jsonData['exercises']
//                 .map((exercise) => ExerciseSubClass.fromJson(exercise))),
//             superset: [],
//             circuit: [],
//             statusCode: jsonData['status_code'],
//           ),
//         );
//       }

//       // Check if superset data is present and add to the list
//       if (jsonData['superset'] != null) {
//         list.add(
//           ExerciseFetchModel(
//             status: jsonData['status'],
//             message: jsonData['message'],
//             exercises: [],
//             superset: List<ExerciseSubClass>.from(jsonData['superset']
//                 .map((superset) => ExerciseSubClass.fromJson(superset))),
//             circuit: [],
//             statusCode: jsonData['status_code'],
//           ),
//         );
//       }

//       // Check if circuit data is present and add to the list
//       if (jsonData['circuit'] != null) {
//         list.add(
//           ExerciseFetchModel(
//             status: jsonData['status'],
//             message: jsonData['message'],
//             exercises: [],
//             superset: [],
//             circuit: List<ExerciseSubClass>.from(jsonData['circuit']
//                 .map((circuit) => ExerciseSubClass.fromJson(circuit))),
//             statusCode: jsonData['status_code'],
//           ),
//         );
//       }

//       return list;
//     } else {
//       throw Exception('Failed to load exercises');
//     }
//   }
// }
import 'dart:convert';
import 'package:fit_pro/domain/models/exercise_fetch/model.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class ExerciseFetchRepo {
  static Future<List<List<ExerciseSubClass>>> fetchExercises(
      String workoutId) async {
    final response = await http.get(
      Uri.parse('http://13.60.105.223/api/v1/workouts/$workoutId/exercises'),
      headers: {
        'Authorization': 'Bearer $accesstocken',
      },
    );

    print(response.body);
    print('http://13.60.105.223/api/v1/workouts/$workoutId/exercises');

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
      return [exercisesList, supersetList, circuitList];
    } else {
      throw Exception('Failed to load exercises');
    }
  }
}
