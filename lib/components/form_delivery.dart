import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/rounded_input_field.dart';
import 'package:sp_shop_app/controllers/delivery_info_controller.dart';

class DeliveryForm extends StatelessWidget {
  const DeliveryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeliveryInfoController d = Get.put(DeliveryInfoController());

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundedInputField(
            hintText: "Người nhận",
            icon: Icon(Icons.people_alt_outlined),
            labelText: "Người nhận",
            onChanged: (value) {
              d.receiver.value = value;
            },
          ),
          RoundedInputField(
              hintText: "Số điện thoại",
              icon: Icon(Icons.phone_android_outlined),
              labelText: "Số điện thoại",
              onChanged: (value) {
                d.phoneNumber.value = value;
              }),
          RoundedInputField(
            hintText: "Địa chỉ",
            icon: Icon(Icons.map_outlined),
            labelText: "Địa chỉ",
            onChanged: (value) {
              d.address.value = value;
            },
          )
        ],
      ),
    );
  }
}
