import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/dropdown.dart';
import 'package:sp_shop_app/controllers/checkout_controller.dart';
import 'package:sp_shop_app/controllers/delivery_info_controller.dart';
import 'package:sp_shop_app/screens/Checkout/components/body.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.CHECKOUT),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
}

