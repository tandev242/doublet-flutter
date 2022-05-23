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
    Object cart = {
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
    if (isCartItemPicked(item)) {
      picked.removeWhere(
          (e) => e.product.id == item.product.id && e.size.id == item.size.id);
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

  isCartItemPicked(item) {
    for (var pickedItem in picked) {
      if (pickedItem.product.id == item.product.id &&
          pickedItem.size.id == item.size.id) {
        return true;
      }
    }
    return false;
  }

  getQuantityAfterVerified(productId, sizeId, quantity) {
    try {
      for (int i = 0; i < cartItems.length; i++) {
        if (cartItems[i].product.id == productId &&
            cartItems[i].size.id == sizeId) {
          return cartItems[i].quantity + quantity;
        }
      }
    } catch (e) {
      printError(info: e.toString());
    }
    return 1;
  }

  getCart() async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      var cart = await CartApi.getCart();
      if (cart.isNotEmpty) {
        cartItems.value = cart;
      }
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
