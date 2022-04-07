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
      throw (e);
    }
  }

  static getCollections(type, slug) async =>
      await http.get('/product/$type/$slug');

  static Future<Product> getProductBySlug(slug) async {
    try {
      print(slug);
      Response result = await http.get('/product/$slug');
      var product = Product.fromJson(result.data["product"]);
      return product;
    } catch (e) {
      throw (e);
    }
  }
}
