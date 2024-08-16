import 'dart:convert';
import 'dart:developer';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:fit_pro/presentation/screens/user_info/height/height.dart';
import 'package:fit_pro/presentation/screens/user_info/height/widget/picker.dart';
import 'package:fit_pro/presentation/screens/user_info/weight/weight.dart';
import 'package:fit_pro/presentation/screens/user_info/weight/widget/picker1.dart';
import 'package:http/http.dart' as http;

import 'package:fit_pro/domain/models/user_info/models.dart';

class UserInfoRepo {
  static Future collectUserInfo(UserInfoModels userinfo) async {
    int weightkg = (weightkgtrueGram * 10).round();
    int weightaL = (weightL * 10).round();
    int heightLB = (heightL * 10).round();
    print(weightkg);
    Map<String, dynamic> req = {
      "age": userinfo.age,
      "gender": userinfo.gender,
      "weight": {
        "value": kg ? "$weightkgtrue.$weightkg" : "$weightF.$weightaL",
        "unit": kg ? "kg" : "lb"
      },
      "height": {
        "value": cm ? '$heightft.$pointheight' : '$heightF.$heightLB',
        "unit": cm ? "cm" : "ft"
      },
      "goal": userinfo.goal,
      "experience": userinfo.experience,
      "workoutType": userinfo.workoutType,
      "workoutFrequency": userinfo.workoutFrequency
    };
    print(weightkg);
    print(req);
    try {
      print(accesstocken);

      final response = await http.put(
        Uri.parse(Apis.userinfo),
        headers: {
          'Authorization': 'Bearer $accesstocken',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(req),
      );
      final responsebody = jsonDecode(response.body);
      print(responsebody);

      if (response.statusCode == 200) {
        print("done");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
