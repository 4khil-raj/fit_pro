import 'dart:convert';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:http/http.dart' as http;

import 'package:fit_pro/domain/models/user_info/models.dart';

class UserInfoRepo {
  static Future collectUserInfo(UserInfoModels userinfo) async {
    Map<String, dynamic> req = {
      "age": userinfo.age,
      "gender": userinfo.gender,
      "weight": {"value": userinfo.weightValue, "unit": userinfo.weightUnit},
      "height": {"value": userinfo.heightValue, "unit": userinfo.heightUnit},
      "goal": userinfo.goal,
      "experience": userinfo.experience,
      "workoutType": userinfo.workoutType,
      "workoutFrequency": userinfo.workoutFrequency
    };

    try {
      final response = await http.post(
        Uri.parse(Apis.userinfo),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(req),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("done");
      }
    } catch (e) {
      print(e);
    }
  }
}
