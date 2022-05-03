import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/order_api.dart';
import 'package:sp_shop_app/utils/constants.dart';

class OrderController extends GetxController {
  var orders = [].obs;
  var orderedOrders = [].obs;
  var packedOrders = [].obs;
  var shippedOrders = [].obs;
  var completedOrders = [].obs;

  getLastStatus(status) {
    for (int i = status.length - 1; i >= 0; i--) {
      if (status[i].isCompleted) {
        return status[i].type;
      }
    }
    return "";
  }

  getOrders() async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      orders.value = await OrderApi.getOrders();
      for (int i = 0; i < orders.length; i++) {
        if (getLastStatus(orders[i].orderStatus) == "ordered") {
          orderedOrders.add(orders[i]);
        } else if (getLastStatus(orders[i].orderStatus) == "packed") {
          packedOrders.add(orders[i]);
        } else if (getLastStatus(orders[i].orderStatus) == "shipped") {
          shippedOrders.add(orders[i]);
        } else if (getLastStatus(orders[i].orderStatus) == "completed") {
          completedOrders.add(orders[i]);
        }
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
