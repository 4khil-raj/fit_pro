import 'dart:convert';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/domain/models/fetch_bookmark/model.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class FetchBookMarkRepo {
  static Future<List<FetchBookModel>> fetchBookmarks() async {
    List<FetchBookModel> list = [];
    try {
      final response = await http.get(
        Uri.parse(Apis.bookmark),
        headers: {
          'Authorization': 'Bearer $accesstocken',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Check if jsonResponse is of the expected structure
        if (jsonResponse['status'] == 200 &&
            jsonResponse['bookmarks'] is List) {
          FetchBookModel fetchBookModel = FetchBookModel.fromJson(jsonResponse);

          // Return a list with a single FetchBookModel object
          list.add(fetchBookModel);
        } else {}
      } else {}
    } catch (e) {
      throw Exception(e);
    }
    return list;
  }
}
