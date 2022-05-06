import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CheckoutController extends GetxController {
  var s = [1, 2, 3, 4].obs;
  
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
