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
      var result = await DeliveryInfoApi.getDeliveryInfo();
      if (result.length > 0) {
        deliveryInfo.value = result;
      }
    } catch (e) {
      throw(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
