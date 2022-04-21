import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/Components/have_already_an_account.dart';
import 'package:sp_shop_app/Components/rounded_button.dart';
import 'package:sp_shop_app/Components/rounded_input_field.dart';
import 'package:sp_shop_app/Components/rounded_password_field.dart';
import 'package:sp_shop_app/controllers/auth_controller.dart';
import 'package:sp_shop_app/screens/Login/login_screen.dart';
import 'package:sp_shop_app/screens/SignUp/components/background.dart';

import 'package:sp_shop_app/utils/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

     void _register() async {
       authController.register();
    }

    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Constants.SIGN_UP.toUpperCase(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            Image.asset("assets/img/logo.png", height: size.height * 0.2),
            RoundedInputField(
              icon: Icon(Icons.people, color: kPrimaryColor),
              hintText: Constants.FULL_NAME,
              onChanged: (value) {
                authController.name.value = value;
              },
            ),
            RoundedInputField(
              icon: Icon(Icons.email, color: kPrimaryColor),
              hintText: Constants.EMAIL,
              onChanged: (value) {
                authController.username.value = value;
                authController.email.value = value;
              },
            ),
            RoundedPasswordField(
              hintText: Constants.PASSWORD,
              onChanged: (value) {
                authController.password.value = value;
              },
            ),
            RoundedPasswordField(
              hintText: Constants.CONFIRM_PASSWORD,
               onChanged: (value) {
                authController.confirmPass.value = value;
              },
            ),
            RoundedButton(press: _register, text: Constants.SIGN_UP),
            HaveAlreadyAnAccountCheck(
                press: () {
                  Get.to(LoginScreen());
                },
                login: true),
          ]),
    );
  }
}
