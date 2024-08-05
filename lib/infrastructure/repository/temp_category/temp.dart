import 'dart:convert';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class CategoriesResponse {
  final int status;
  final String message;
  final List<String> completedCategories;

  CategoriesResponse({
    required this.status,
    required this.message,
    required this.completedCategories,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      status: json['status'],
      message: json['message'],
      completedCategories: List<String>.from(json['completedCategories']),
    );
  }
}

List categoryforWorkout = [];

class CategoriesRepositoryFetchTemap {
  static fetchCompletedCategories() async {
    final response = await http.get(
        Uri.parse(
            'http://13.60.105.223/api/v1/workouts/user-workouts/completed-categories'),
        headers: {
          'Authorization': 'Bearer $accesstocken',
        });
    print(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final categoriesResponse = CategoriesResponse.fromJson(jsonResponse);
      categoryforWorkout = categoriesResponse.completedCategories;
    } else {
      throw Exception('Failed to load completed categories');
    }
  }
}

class CategoriesRepositoryAddTemp {
  static add(String workoutId, String categoryId) async {
    final response = await http.post(
        Uri.parse(
            'http://13.60.105.223/api/v1/workouts/user-workouts/categories/$categoryId'),
        headers: {
          'Authorization': 'Bearer $accesstocken',
        });
    print('===============[=============]');
    print(response.body);
    print('===============[=============]');

    if (response.statusCode == 200) {
      CategoriesRepositoryFetchTemap.fetchCompletedCategories();
    }
  }
}
