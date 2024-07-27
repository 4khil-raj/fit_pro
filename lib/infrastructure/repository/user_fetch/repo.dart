import 'dart:convert';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/domain/models/user_fetch/model.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static Future<UserFetchModel> fetchUser() async {
    print('========+++++++++++===========');
    final response = await http.get(
      Uri.parse(Apis.userFetch),
      headers: {
        'Authorization': 'Bearer $accesstocken',
      },
    );

    if (response.statusCode == 200) {
      try {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse['status'] != null &&
            jsonResponse['message'] != null &&
            jsonResponse['user'] != null &&
            jsonResponse['status_code'] != null) {
          final model = UserFetchModel.fromJson(jsonResponse);
          print(model.user?.name);
          print(model.user?.age);
          return model;
        } else {
          throw Exception('Invalid data format');
        }
      } catch (e) {
        throw Exception('Failed to parse user data: $e');
      }
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
