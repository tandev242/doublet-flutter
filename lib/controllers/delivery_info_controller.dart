import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/delivery_info_api.dart';
import 'package:sp_shop_app/components/form_delivery.dart';
import 'package:sp_shop_app/components/rounded_button.dart';
import 'package:sp_shop_app/entities/address.dart';
import 'package:sp_shop_app/utils/constants.dart';

class DeliveryInfoController extends GetxController {
  var deliveryInfo = [].obs;
  var pickedAddress =
      Address(id: '', name: '', phoneNumber: '', address: '', isDefault: true)
          .obs;
  var addresses = <String>[];
  var addressesValue = <String>[];
  var receiver = "".obs;
  var phoneNumber = "".obs;
  var address = "".obs;

  mapAddressesToDropDown(list) {
    addresses = [];
    addressesValue = [];
    for (final item in list) {
      addresses.add(item.address);
      addressesValue.add(item.id);
    }
  }

  setPickedAddress(value) {
    pickedAddress.value =
        deliveryInfo.firstWhere((item) => item.address == value);
  }

  getDeliveryInfo() async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      var result = await DeliveryInfoApi.getDeliveryInfo();
      print(result);
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

  addDeliveryInfo() async {
    Get.defaultDialog(
        title: "Thông tin nhận hàng",
        content: DeliveryForm(),
        confirm: RoundedButton(press: callAddDeliveryAPI, text: "Thêm"),
        textCancel: "Hủy",
        onCancel: () {
          receiver.value = "";
          phoneNumber.value = "";
          address.value = "";
        });
  }

  callAddDeliveryAPI() async {
    if (receiver.value.isEmpty ||
        phoneNumber.value.isEmpty ||
        address.value.isEmpty) {
      Get.defaultDialog(
        title: Constants.WARNING_TITLE,
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: "Có thông tin chưa được nhập!",
        textCancel: Constants.I_KNOW,
      );
      return;
    }
    var data = {
      "address": {
        "name": receiver.value,
        "phoneNumber": phoneNumber.value,
        "address": address.value
      }
    };
    try {
      EasyLoading.show(status: Constants.WAIT);
      var response = await DeliveryInfoApi.addDeliveryInfo(data);
      EasyLoading.dismiss();
      if (response != null) {
        print("===> Response add delivery: $response");
        receiver.value = "";
        phoneNumber.value = "";
        address.value = "";
      } else {
        Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: "Thêm địa chỉ không thành công",
          textCancel: Constants.I_KNOW,
        );
      }
      Get.back();
    } catch (e) {
      rethrow;
    }
  }

  deleteDelivery(selectedItem) async {
    var id = selectedItem.id;
    var data = {
      "payload": {"addressId": id}
    };
    print(data);
    EasyLoading.show(status: Constants.WAIT);
    var response = await DeliveryInfoApi.deleteDeliveryInfo(data);
    EasyLoading.dismiss();
    if (response != null) {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: "Xóa địa chỉ thành công",
          textCancel: Constants.I_KNOW);
    } else {
      Get.defaultDialog(
          title: Constants.WARNING_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: "Xóa địa chỉ không thành công.Vui lòng thử lại!",
          textCancel: Constants.I_KNOW);
    }
  }
}
