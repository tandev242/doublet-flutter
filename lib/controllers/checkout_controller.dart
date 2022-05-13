import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum PaymentType { cod, momo }
class CheckoutController extends GetxController {
  var s = [1, 2, 3, 4].obs;
  var delivery = 'Dia chi 1'.obs;
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
}
