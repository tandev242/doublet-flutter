import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/auth_api.dart';
import 'package:sp_shop_app/controllers/delivery_info_controller.dart';
import 'package:sp_shop_app/entities/user.dart';
import 'package:sp_shop_app/screens/Home/home_screen.dart';
import 'package:sp_shop_app/screens/Login/login_screen.dart';
import 'package:sp_shop_app/screens/Welcome/welcome_screen.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_shop_app/utils/http.dart';

class AuthController extends GetxController {
  var name = ''.obs;
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPass = ''.obs;
  final user = User(name: '', role: '', email: '', photo: '').obs;

  Future<dynamic> login() async {
    try {
      var data = {"email": username.value, "password": password.value};
      EasyLoading.show(status: Constants.WAIT);
      var result = await AuthApi.login(data);
      if (result != null) {
        EasyLoading.dismiss();
        user.value = User.fromJson(result['user']);
        String token = result['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await http.auth();
        Get.to(HomeScreen());
        // after login successfully, we need to load us delivery info
        DeliveryInfoController _deliveryInfoController =
            Get.put(DeliveryInfoController());
        _deliveryInfoController.getDeliveryInfo();
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

  Future<dynamic> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Get.to(WelcomeScreen());
    Get.defaultDialog(
      title: "Đăng xuất",
      titleStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
      middleText: "Đăng xuất thành công",
      textCancel: Constants.OK,
    );
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
      if (password.value.length < 8) {
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
          middleText: Constants.REGISTER_FAILED,
          textCancel: Constants.I_KNOW,
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: Constants.WARNING_TITLE,
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: Constants.REGISTER_FAILED,
        textCancel: Constants.I_KNOW,
      );
    }
  }
}
