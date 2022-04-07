import 'package:dio/dio.dart';
import 'package:sp_shop_app/entities/category.dart';
import '../utils/http.dart';

class CategoryApi {
  static Future<List<dynamic>> getCategories() async {
    try {
      Response result = await http.get('/category/getFlatCategories');
      var categories = result.data["categories"]
          .map((category) => Category.fromJson(category))
          .toList();
      return categories;
    } catch (e) {
      throw (e);
    }
  }
}
