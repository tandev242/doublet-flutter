import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sp_shop_app/apis/order_api.dart';
import 'package:sp_shop_app/screens/SuccessScreen/success_screen.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

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

    Map<dynamic, dynamic> order = {
      'items': orderItems,
      'addressId': addressId,
      'totalAmount': totalAmount,
      'paymentStatus': paymentStatus,
      'paymentType': type.value == PaymentType.cod ? "cod" : "momo"
    };
    print(order);
    if (type.value == PaymentType.cod) {
      bool isAdded = await OrderApi.addOrder(order);
      if (isAdded) {
        Get.to(const SuccessScreen());
      } else {
        Get.defaultDialog(
            title: "Thanh toán thất bại",
            titleStyle:
                TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
            middleText: "Chưa thể thanh toán",
            textCancel: Constants.OK);
      }
    } else {
      Object payload = {"order": order};
      String url = await OrderApi.addOrderByMomo(payload);
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        Get.defaultDialog(
            title: "Thanh toán thất bại",
            titleStyle:
                TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
            middleText: "Chưa thể thanh toán",
            textCancel: Constants.OK);
      }
    }
  }
}
