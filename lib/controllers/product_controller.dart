import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/product_api.dart';
import 'package:sp_shop_app/components/custom_radio.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';
import 'package:sp_shop_app/entities/product.dart';
import 'package:sp_shop_app/utils/constants.dart';

class ProductController extends GetxController {
  final CartController _cartController = Get.put(CartController());
  var recommendedProducts = [].obs;
  var featuredProducts = [].obs;
  var productsByCategory = [].obs;
  var productSearched = [].obs;
  var productBySlug = Product(
      id: '',
      name: '',
      slug: '',
      description: '',
      productPictures: [],
      price: 0,
      sizes: []).obs;
  var sizeSelected = ''.obs;
  var quantitySelected = 1.obs;
  var isReadyToBuy = false.obs;
  onChangeQuantity(quantity) {
    int flag = quantitySelected.value;
    if (flag + quantity > 0) {
      quantitySelected += quantity;
    }
  }

  getProducts() async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      featuredProducts.value = await ProductApi.getProducts();
      var list = await ProductApi.getRecommendedProductsByBehavior();
      print(list);
      if (list.isNotEmpty) {
        recommendedProducts.value = list;
        print(list);
      } else {
        recommendedProducts.value = featuredProducts.reversed.toList();
      }
      EasyLoading.dismiss();
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

  getProductsSearched(text) async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      productSearched.value = await ProductApi.getProductsSearched(text);
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

  addToCart(Product product) {
    Get.defaultDialog(
      title: "Chọn size",
      content: CustomRadio(),
      textConfirm: "Xác nhận",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Object cartItem = {
          "product": product.id.toString(),
          "size": sizeSelected.value,
          "quantity": _cartController.getQuantityAfterVerified(
              product.id.toString(), sizeSelected.value, 1)
        };
        _cartController.addToCart(cartItem);
      },
      textCancel: "Hủy",
      onCancel: () {
        isReadyToBuy.value = false;
      },
    );
  }
}
