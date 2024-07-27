import 'dart:convert';

import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:fit_pro/presentation/widgets/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddBookMarkRepo {
  static Future<void> addBookMark(String dayID, context) async {
    print(Apis.bookmark + dayID);
    try {
      final response = await http.post(
        Uri.parse(Apis.bookmark + dayID),
        headers: {
          'Authorization': 'Bearer $accesstocken',
        },
      );

      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        customSnackbar(context, body['message'], Colors.green);
      } else {
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }
}
