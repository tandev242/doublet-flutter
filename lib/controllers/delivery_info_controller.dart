import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/delivery_info_api.dart';
import 'package:sp_shop_app/entities/address.dart';
import 'package:sp_shop_app/utils/constants.dart';

class DeliveryInfoController extends GetxController {
  var deliveryInfo = [].obs;
  var pickedAddress =
      Address(id: '', name: '', phoneNumber: '', address: '', isDefault: true).obs;
  var addresses = <String>[];
  var addressesValue = <String>[];

  mapAddressesToDropDown(list) {
    for(final item in list){
      addresses.add(item.address);
      addressesValue.add(item.id);
    }
  }
  
  setPickedAddress(value) {
    pickedAddress.value = deliveryInfo.firstWhere((item) => item.address == value);
  }

  getDeliveryInfo() async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      var result = await DeliveryInfoApi.getDeliveryInfo();
      if (result.length > 0) {
        deliveryInfo.value = result;
        pickedAddress.value = result[0];
        mapAddressesToDropDown(result);
      }
    } catch (e) {
      throw (e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
