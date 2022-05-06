import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/delivery_info_api.dart';
import 'package:sp_shop_app/utils/constants.dart';

class DeliveryInfoController extends GetxController {
  var deliveryInfo = [].obs;

  getDeliveryInfo() async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      deliveryInfo.value = await DeliveryInfoApi.getDeliveryInfo();
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
