import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fit_pro/core/apis/apis.dart';

class LoginRepo {
  static Future<String> loginReq(String password, String email) async {
    Map<String, dynamic> request = {"email": email, "password": password};
    print(request);
    try {
      final response = await http.post(
        Uri.parse(Apis.loggin),
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
