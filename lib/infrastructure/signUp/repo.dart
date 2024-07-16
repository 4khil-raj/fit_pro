import 'dart:convert';

import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/domain/models/signup/model.dart';
import 'package:http/http.dart' as http;

class SignUpRepo {
  static Future<String> signupRequest(SignUpModel model) async {
    Map<String, dynamic> request = {
      "email": model.useremail,
      "password": model.password
    };
    try {
      final response = await http.post(
        Uri.parse(Apis.restration),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request),
      );
      if (response.statusCode == 200) {
        return "done";
      } else {
        final responseBody = jsonDecode(response.body);
        return responseBody["message"];
      }
    } catch (e) {
      return "some error occurred: $e";
    }
  }
}
