import 'dart:convert';

import 'package:fit_pro/application/user_fetch/userfetch_bloc.dart';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/domain/models/profile_update/update.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:fit_pro/presentation/widgets/alerts/alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class UpdateProfileDetailsRepo {
  static updateProfile(ProfileUpdateModel model, context) async {
    Map<String, dynamic> req = {
      'name': model.name,
      'email': model.email,
      'gender': model.gender,
      "height": {"value": model.height},
      "weight": {"value": model.weight},
    };

    final response = await http.put(
      Uri.parse(Apis.profileUpdate),
      body: (jsonEncode(req)),
      headers: {
        'Authorization': 'Bearer $accesstocken',
        'Content-Type': 'application/json'
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      Navigator.pop(context);
      BlocProvider.of<UserfetchBloc>(context).add(UserFetchReq());
    } else {
      alerts(context, "Try Again!");
    }
  }
}
