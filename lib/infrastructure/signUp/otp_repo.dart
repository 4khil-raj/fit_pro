import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fit_pro/core/apis/apis.dart';

class SignUpOtpRepo {
  Future signupOtp(String email, otp) async {
    Map<String, dynamic> validate = {"email": email, "otp": otp};
    try {
      final response = await http.post(
        Uri.parse(Apis.singupOtpverify),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(validate),
      );
      final responseData = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        return responseData["accessToken"];
      } else {
        return 'faild';
      }
    } catch (e) {
      print(e);
    }
  }
}
