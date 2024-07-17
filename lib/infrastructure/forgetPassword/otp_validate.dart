import 'dart:convert';

import 'package:fit_pro/core/apis/apis.dart';
import 'package:http/http.dart' as http;

class ValidateForgetOtp {
  static Future validateOtp(String email, String otp) async {
    Map<String, dynamic> req = {"email": email, "otp": otp};

    try {
      final response = await http.post(
        Uri.parse(Apis.verifyForgetOtp),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(req),
      );
      // print(response.statusCode);
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
