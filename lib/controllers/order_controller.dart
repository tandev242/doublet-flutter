import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/order_api.dart';
import 'package:sp_shop_app/utils/constants.dart';

class OrderController extends GetxController {
  var orders = [].obs;

  getOrders() async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      orders.value = await OrderApi.getOrders();
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
