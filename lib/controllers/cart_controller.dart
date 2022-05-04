import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/cart_api.dart';
import 'package:sp_shop_app/utils/constants.dart';

class CartController extends GetxController {
  var cartItems = [].obs;
  var totalAmount = 0.obs;
  var picked = [].obs;

  removeCartItem(cartItem) async {
    EasyLoading.show(status: Constants.WAIT);
    var item = {"cartItem": cartItem};
    bool isRemoved = await CartApi.removeCartItem(item);
    if (isRemoved) {
      cartItems.value = await CartApi.getCart();
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: "XÓA KHỎI GIỎ",
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: Constants.ADD_SUCCESSFULLY,
        textCancel: Constants.OK,
      );
    }
  }

  addToCart(cartItem) async {
    EasyLoading.show(status: Constants.WAIT);
    var cart = {
      "cartItems": [cartItem]
    };
    bool isAdded = await CartApi.addToCart(cart);
    if (isAdded) {
      cartItems.value = await CartApi.getCart();
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: "THÊM VÀO GIỎ",
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: Constants.ADD_SUCCESSFULLY,
        textCancel: Constants.OK,
      );
    }
  }

  changeQuantityProductInCart(cartItem) async {
    EasyLoading.show(status: Constants.WAIT);
    var cart = {
      "cartItems": [cartItem]
    };
    if (cartItem["quantity"] >= 1) {
      bool isAdded = await CartApi.addToCart(cart);
      if (isAdded) {
        cartItems.value = await CartApi.getCart();
        EasyLoading.dismiss();
      }
    } else {
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: "Tăng/giảm số lượng",
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: "Số lượng không phù hợp !",
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

  getQuantityAfterVerified(productId, sizeId) {
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].product.id == productId &&
          cartItems[i].size.id == sizeId) {
        return cartItems[i].quantity + 1;
      }
    }
    return 1;
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
