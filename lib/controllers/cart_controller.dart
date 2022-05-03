import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/cart_api.dart';
import 'package:sp_shop_app/utils/constants.dart';

class CartController extends GetxController {
  var cartItems = [].obs;
  var totalAmount = 0.obs;
  var picked = [].obs;

  addToCart(cartItem) async {
    var cartItems = {
      "cartItems": [cartItem]
    };
    bool isAdded = await CartApi.addToCart(cartItems);
    if (isAdded) {
      await getCart();
      Get.defaultDialog(
        title: "THÊM VÀO GIỎ",
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: Constants.ADD_SUCCESSFULLY,
        textCancel: Constants.OK,
      );
    }
  }

  pickToggle(item) {
    if (picked.contains(item)) {
      picked.remove(item);
    } else {
      picked.add(item);
    }
    getTotalAmount();
  }

  getTotalAmount() {
    totalAmount.value = 0;
    for (var i = 0; i < picked.length; i++) {
      totalAmount += picked[i].product.price * picked[i].quantity;
    }
  }

  getCart() async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      cartItems.value = await CartApi.getCart();
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
}
