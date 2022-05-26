import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/rounded_button.dart';
import 'package:sp_shop_app/components/rounded_input_field.dart';
import 'package:sp_shop_app/components/rounded_password_field.dart';
import 'package:sp_shop_app/controllers/auth_controller.dart';
import 'package:sp_shop_app/screens/SignUp/components/background.dart';
import 'package:sp_shop_app/screens/otp/otp_screen.dart';
import 'package:sp_shop_app/utils/constants.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    void sendEmail() {
      authController.sendEmaiForgot();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(Constants.FORGET_PASSWORD),
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
        body: Background(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                RoundedInputField(
                  icon: Icon(Icons.email_outlined),
                    hintText: Constants.EMAIL,
                    labelText: Constants.EMAIL,
                    onChanged: (value) {
                      authController.emailGetPass.value = value;
                    }),
                RoundedPasswordField(
                  hintText: Constants.PASSWORD,
                  labelText: Constants.PASSWORD,
                   onChanged: (value) {
                      authController.newPass.value = value;
                    }),
                RoundedPasswordField(
                  hintText: Constants.PASSWORD,
                  labelText: Constants.PASSWORD,
                   onChanged: (value) {
                      authController.confirmPass.value = value;
                    }),
                
                SizedBox(height: 40.0),
                RoundedButton(
                    press: sendEmail,
                    text: "Gửi mã xác nhận")
              ]),
            )));
  }
}
