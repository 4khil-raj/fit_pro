import 'dart:convert';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/domain/models/category_fetch/model.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<List<CategoryFetchModel>> fetchCategories(String id) async {
    try {
      final response = await http.get(
        Uri.parse('${Apis.categoryFetch}$id?populate=true'),
        headers: {
          'Authorization': 'Bearer $accesstocken',
        },
      );
      print('${Apis.categoryFetch}$id?populate=true');
      print(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final categoryData = jsonData['category'];
        final CategoryFetchModel category =
            CategoryFetchModel.fromJson(categoryData);
        return [category];
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load categories');
    }
  }
}
