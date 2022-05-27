import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/auth_api.dart';
import 'package:sp_shop_app/apis/user_api.dart';
import 'package:sp_shop_app/controllers/delivery_info_controller.dart';
import 'package:sp_shop_app/entities/user.dart';
import 'package:sp_shop_app/screens/Home/home_screen.dart';
import 'package:sp_shop_app/screens/Login/login_screen.dart';
import 'package:sp_shop_app/screens/SuccessScreen/success_screen.dart';
import 'package:sp_shop_app/screens/Welcome/welcome_screen.dart';
import 'package:sp_shop_app/screens/otp/otp_screen.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_shop_app/utils/http.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      "707494384451-n2h8k22labbk1hqo3abuen1i5kdp40dn.apps.googleusercontent.com",
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class AuthController extends GetxController {
  var name = ''.obs;
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPass = ''.obs;
  var user = User(name: '', role: '', email: '', photo: '').obs;
  var newName = "".obs;
  var currentPass = "".obs;
  var newPass = "".obs;
  var emailGetPass = "".obs;
  /**
   * biến otp
   */
  var o1 = "".obs;
  var o2 = "".obs;
  var o3 = "".obs;
  var o4 = "".obs;
  var o5 = "".obs;
  var o6 = "".obs;

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

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
        confirmPass.value = "";
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

  void updateInfo() async {
    var data = {"name": newName.value, "profilePicture": user.value.photo};
    print(data);
    EasyLoading.show(status: Constants.WAIT);
    var result = await UserApi.update(data);
    EasyLoading.dismiss();
    if (result != null &&
        result["message"] != null &&
        result["message"].toString().contains("Updated successfully")) {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.UPDATE_INFO_SUCCESS,
          textCancel: Constants.WONDER);
      user.value = await User.fromJson(result['user']);
    } else {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.UPDATE_INFO_FAILED,
          textCancel: Constants.I_KNOW);
    }
  }

  void changePassword() async {
    if (currentPass.value.isEmpty || newPass.value.isEmpty) {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.MISS_FIELD,
          textCancel: Constants.I_KNOW);
      return;
    }

    if (currentPass.value == password.value) {
      if (newPass.value.length < 8) {
        Get.defaultDialog(
            title: Constants.NOTIFY_TITLE,
            titleStyle:
                TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
            middleText: Constants.NOT_ENOUGH_LENGTH,
            textCancel: Constants.I_KNOW);
      } else {
        if (newPass.value == confirmPass.value) {
          var data = {"password": newPass.value};
          var email = {"email": user.value.email};
          var res = AuthApi.sendOtpByEmail(email);
          Get.to(() => OtpScreen(email: user.value.email));
        } else {
          Get.defaultDialog(
              title: Constants.NOTIFY_TITLE,
              titleStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
              middleText: Constants.PASS_NO_MATCH,
              textCancel: Constants.WONDER);
        }
      }
    } else {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.NOT_RIGHT_PASSWORD,
          textCancel: Constants.I_KNOW);
    }
  }

  void sendEmaiForgot() async {
    var email = {
      "email": emailGetPass.value,
    };
    if (!emailGetPass.value.isEmail) {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.INVALID_EMAIL,
          textCancel: Constants.I_KNOW);
      return;
    }
    if (newPass.value.length < 8) {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.NOT_ENOUGH_LENGTH,
          textCancel: Constants.I_KNOW);

      return;
    }
    if (newPass.value != confirmPass.value) {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.PASS_NO_MATCH,
          textCancel: Constants.WONDER);
      return;
    }
    EasyLoading.show(status: Constants.WAIT);
    var res = await AuthApi.sendOtpByEmail(email);
    EasyLoading.dismiss();
    if (res != null &&
        res["message"].toString().contains("Otp sent to email successfully")) {
      Get.to(() => OtpScreen(email: emailGetPass.value));
    } else {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.REFILL_EMAIL,
          textCancel: Constants.I_KNOW);
    }
  }

  void resetPass() async {
    var otp = o1.value + o2.value + o3.value + o4.value + o5.value + o6.value;
    print(o1.value);
    print(o2.value);
    print(o3.value);
    print(o4.value);
    print(o5.value);
    print(o6.value);
    print(otp);
    if (otp.length < 6) {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.INVALID_OTP,
          textCancel: Constants.I_KNOW);
      return;
    }
    if (user.value.email != "") {
      emailGetPass.value = user.value.email;
    }
    var info = {
      "email": emailGetPass.value,
      "password": newPass.value,
      "otp": otp
    };
    print(info);
    EasyLoading.show(status: Constants.WAIT);
    var response = await AuthApi.forget(info);
    EasyLoading.dismiss();
    if (response != null && response['message'] == "Updated successfully") {
      email.value = emailGetPass.value;
      password.value = newPass.value;
      loginFromSuccessScreen();
    } else {
      Get.defaultDialog(
          title: Constants.NOTIFY_TITLE,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          middleText: Constants.NOT_MATCH_OTP,
          textCancel: Constants.I_KNOW);
    }
    emailGetPass.value = "";
    newPass.value = "";
  }

  void loginFromSuccessScreen() async {
    var data = {"email": email.value, "password": password.value};
    EasyLoading.show(status: Constants.WAIT);
    var result = await AuthApi.login(data);
    EasyLoading.dismiss();
    if (result != null) {
      Get.to(() => HomeScreen());
    }
  }
}
