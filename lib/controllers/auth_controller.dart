import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/auth_api.dart';
import 'package:sp_shop_app/screens/Home/home_screen.dart';
import 'package:sp_shop_app/screens/Login/login_screen.dart';
import 'package:sp_shop_app/utils/constants.dart';

class AuthController extends GetxController {
  var name = ''.obs;
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPass = ''.obs;

  Future<dynamic> login() async {
    try {
      var data = {"email": username.value, "password": password.value};
      EasyLoading.show(status: Constants.WAIT);
      var result = await AuthApi.login(data);
      if (result != null) {
        EasyLoading.dismiss();
        Get.to(HomeScreen());
      } else {
        EasyLoading.dismiss();
        Get.defaultDialog(
          title: Constants.WARNING_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.LOGIN_FAILED,
          textCancel: Constants.I_KNOW,
        );
      }
    } catch (e) {
       EasyLoading.dismiss();
      Get.defaultDialog(
          title: Constants.WARNING_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.LOGIN_FAILED,
          textCancel: Constants.I_KNOW,
      );
    }
  }

  Future<dynamic> register() async {
    try {
      if (name.value.isEmpty || email.value.isEmpty || password.value.isEmail) {
        print("Miss field !");
        Get.defaultDialog(
          title: Constants.WARNING_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.MISS_FIELD,
          textCancel: Constants.I_KNOW,
        );
        return;
      }
      if (!email.value.isEmail) {
        print("Email is not valid");
        Get.defaultDialog(
          title: Constants.WARNING_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.INVALID_EMAIL,
          textCancel: Constants.I_KNOW,
        );
        return;
      }
      if(password.value.length < 8){
        Get.defaultDialog(
          title: Constants.WARNING_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.NOT_ENOUGH_LENGTH,
          textCancel: Constants.I_KNOW,
        );
        return;
      }
      if (confirmPass.value != password.value) {
        print("Confirm password no match");
        Get.defaultDialog(
          title: Constants.WARNING_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.PASS_NO_MATCH,
          textCancel: Constants.I_KNOW,
        );
        return;
      }

      var data = {
        "name": name.value,
        "username": username.value,
        "email": email.value,
        "password": password.value
      };
      EasyLoading.show(status: Constants.WAIT);
      var result = await AuthApi.register(data);
      if (result != null) {
        EasyLoading.showSuccess(Constants.REGISTER_SUCCESS);
        Get.to(LoginScreen());
      } else {
        EasyLoading.dismiss();
        Get.defaultDialog(
          title: Constants.WARNING_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.REGISTER_FAILED ,
          textCancel: Constants.I_KNOW,
        );
      }
      
    } catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: Constants.WARNING_TITLE,
        titleStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: Constants.REGISTER_FAILED,
        textCancel: Constants.I_KNOW,
      );
    }
  }
}
