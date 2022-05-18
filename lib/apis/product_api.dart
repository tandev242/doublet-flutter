import 'package:dio/dio.dart';
import 'package:sp_shop_app/entities/product.dart';
import '../utils/http.dart';

class ProductApi {
  static Future<List<dynamic>> getProducts() async {
    try {
      Response result = await http.post('/product/getProducts');
      var products = result.data["products"]
          .map((product) => Product.fromJson(product))
          .toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<dynamic>> getCollections(slug) async {
    try {
      Response result = await http.get('/product/category/$slug');
      var products = result.data["products"]
          .map((product) => Product.fromJson(product))
          .toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Product> getProductBySlug(slug) async {
    try {
      Response result = await http.get('/product/$slug');
      var product = Product.fromJson(result.data["product"]);
      return product;
    } catch (e) {
      rethrow;
    }
  }
}
