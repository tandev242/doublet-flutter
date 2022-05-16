import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/product_api.dart';
import 'package:sp_shop_app/entities/product.dart';
import 'package:sp_shop_app/utils/constants.dart';

class ProductController extends GetxController {
  var hotProducts = [].obs;
  var featuredProducts = [].obs;
  var productsByCategory = [].obs;
  var productBySlug = Product(
          id: '',
          name: '',
          slug: '',
          description: '',
          productPictures: [],
          price: 0)
      .obs;
  var quantitySelected = 1.obs;

  onChangeQuantity(quantity) {
    int flag = quantitySelected.value;
    if (flag + quantity > 0) {
      quantitySelected += quantity;
    }
  }

  getProducts() async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      hotProducts.value = await ProductApi.getProducts();
      featuredProducts.value = hotProducts.reversed.toList();
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: Constants.WARNING_TITLE,
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: "Đã có lỗi xảy ra",
        textCancel: Constants.I_KNOW,
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  getProductsByCategory(slug) async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      productsByCategory.value = await ProductApi.getCollections(slug);
      if (productsByCategory.length > 20) {
        productsByCategory.getRange(0, 20);
      }
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: Constants.WARNING_TITLE,
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: "Đã có lỗi xảy ra",
        textCancel: Constants.I_KNOW,
      );
    }
  }

  getProduct(slug) async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      productBySlug.value = await ProductApi.getProductBySlug(slug);
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: Constants.WARNING_TITLE,
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: "Đã có lỗi xảy ra",
        textCancel: Constants.I_KNOW,
      );
    }
  }
}
