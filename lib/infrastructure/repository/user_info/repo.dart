import 'dart:convert';
import 'dart:developer';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:fit_pro/presentation/screens/user_info/height/widget/picker.dart';
import 'package:fit_pro/presentation/screens/user_info/weight/widget/picker1.dart';
import 'package:http/http.dart' as http;

import 'package:fit_pro/domain/models/user_info/models.dart';

class UserInfoRepo {
  static Future collectUserInfo(UserInfoModels userinfo) async {
    print(accesstocken);
    String heightUinit = ("${userinfo.heightValue}.${userinfo.weightUnit}");
    String weightUnit = ("${userinfo.weightValue}.${userinfo.weightUnit}");
    Map<String, dynamic> req = {
      "age": userinfo.age,
      "gender": userinfo.gender,
      "weight": {"value": heightUinit, "unit": kg ? "kg" : "lb"},
      "height": {"value": weightUnit, "unit": cm ? "cm" : "ft"},
      "goal": userinfo.goal,
      "experience": userinfo.experience,
      "workoutType": userinfo.workoutType,
      "workoutFrequency": userinfo.workoutFrequency
    };
    print(req);
    try {
      print(accesstocken);

      final response = await http.post(
        Uri.parse(Apis.userinfo),
        headers: {
          'Authorization': 'Bearer $accesstocken',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(req),
      );
      final responsebody = jsonDecode(response.body);
      print(responsebody);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("done");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
