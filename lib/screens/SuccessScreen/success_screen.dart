import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/rounded_button.dart';
import 'package:sp_shop_app/screens/Home/home_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage('assets/img/success.gif')),
          Text(
            "Thanh toán thành công !",
            style: TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 75, 67, 67),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10.0,
          ),
          RoundedButton(
              press: () {
                Get.to(HomeScreen());
              },
              text: "Trở về trang chủ")
        ],
      ),
    ));
  }
}
