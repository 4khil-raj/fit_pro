import 'dart:convert';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:http/http.dart' as http;

class ChangePasswordRepo {
  static Future<bool> changePasscode(
      String email, String password, String otp) async {
    Map<String, dynamic> req = {
      "email": email,
      "otp": otp,
      "password": password
    };
    try {
      final response = await http.patch(
        Uri.parse(Apis.changePassword),
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
      return false;
    }
  }
}
