import 'package:get/get.dart';
import 'package:sp_shop_app/apis/category_api.dart';
import 'package:sp_shop_app/entities/category.dart';

class CategoryController extends GetxController {
  var categories = [].obs;
  @override
  void onInit() async {
    super.onInit();
    Future<List> futureCategories = CategoryApi.getCategories();
    categories.value = await futureCategories;
  }
}
