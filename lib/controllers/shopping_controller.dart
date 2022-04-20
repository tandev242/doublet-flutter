import 'package:get/get.dart';
import 'package:sp_shop_app/apis/product_api.dart';

class ShoppingController extends GetxController {
  var products = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    Future<List> futureProducts = ProductApi.getProducts();
    List list = await futureProducts;
    print(list);
    products.value = list;  
  }
}
