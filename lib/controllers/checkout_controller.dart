import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sp_shop_app/apis/order_api.dart';
import 'package:sp_shop_app/screens/Cart/cart_screen.dart';
import 'package:sp_shop_app/screens/Home/home_screen.dart';
import 'package:sp_shop_app/screens/MyOrders/my_orders_screen.dart';
import 'package:sp_shop_app/screens/SuccessScreen/success_screen.dart';
import 'package:sp_shop_app/utils/constants.dart';

enum PaymentType { cod, momo }

class CheckoutController extends GetxController {
  var type = PaymentType.cod.obs;

  getList(context, position) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          position.toString(),
          style: TextStyle(fontSize: 22.0),
        ),
      ),
    );
  }

  purchaseOrder(cartItems, addressId, totalAmount,
      {paymentStatus = 'pending'}) async {
    List orderItems = cartItems
        .map((item) => {
              "productId": item.product.id,
              "sizeId": item.size.id,
              "payablePrice": item.product.price * item.quantity,
              "purchaseQty": item.quantity
            })
        .toList();
    if (type.value == PaymentType.cod) {
      Map<String, dynamic> order = {
        'items': orderItems,
        'addressId': addressId,
        'totalAmount': totalAmount,
        'paymentStatus': paymentStatus,
        'paymentType': 'cod'
      };

      bool isAdded = await OrderApi.addOrder(order);
      if (isAdded) {
        // Get.defaultDialog(
        //     title: "Thanh toán thành công",
        //     titleStyle:
        //         TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        //     textConfirm: Constants.ADD_ORDER_SUCCESSFULLY,
        //     textCancel: Constants.BACK_TO_CART,
        //     confirmTextColor: Colors.white,
        //     middleText: "",
        //     onConfirm: () => {Get.to(const MyOrdersScreen())},
        //     onCancel: () => {Get.to(const CartScreen())});
        Get.to(() => SuccessScreen(
            title: "Thanh toán thành công",
            textButton: "Quay về Trang chủ",
            press: () {
              Get.to(() => HomeScreen());
            }));
      } else {
        Get.defaultDialog(
            title: "Thanh toán thất bại",
            titleStyle:
                TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
            middleText: "Chưa thể thanh toán",
            textCancel: Constants.OK);
      }
    } else {
      Get.defaultDialog(
          title: "Thanh toán thất bại",
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: "Chức năng hiện tại chưa có",
          textCancel: Constants.OK);
    }
  }
}
