import 'dart:convert';

import 'package:fit_pro/core/apis/apis.dart';
import 'package:http/http.dart' as http;

class ForgetGetOptRepo {
  static Future getOtp(String email) async {
    Map<String, dynamic> req = {"email": email};

    try {
      final response = await http.post(
        Uri.parse(Apis.forgetPassword),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(req),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
