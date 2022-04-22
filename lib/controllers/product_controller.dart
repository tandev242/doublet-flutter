import 'package:get/get.dart';
import 'package:sp_shop_app/apis/product_api.dart';

class ProductController extends GetxController {
  var products = [].obs;

  @override
  void onInit() async {
    super.onInit();
    Future<List> futureProducts = ProductApi.getProducts();
    products.value = await futureProducts;
  }
}
