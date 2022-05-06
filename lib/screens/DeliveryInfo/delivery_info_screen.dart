import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/controllers/delivery_info_controller.dart';
import 'package:sp_shop_app/utils/constants.dart';

class DeliveryInfoScreen extends StatelessWidget {
  DeliveryInfoScreen({Key? key}) : super(key: key);
  DeliveryInfoController _deliveryInfoController =
      Get.put(DeliveryInfoController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          Constants.RECEIVE_ADDRESS,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: size.height,
          child: Obx(() => AnimatedList(
              itemBuilder: (context, index, animation) {
                return Container();
              },
              initialItemCount: 1))),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
