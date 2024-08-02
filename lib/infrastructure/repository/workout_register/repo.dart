import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class WorkoutRegisterRepo {
  static Future<void> workoutRegisterRepo(String workoutID) async {
    try {
      final response = await http.post(
        Uri.parse('${Apis.workoutRegister}$workoutID'),
        headers: {
          'Authorization': 'Bearer $accesstocken',
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
