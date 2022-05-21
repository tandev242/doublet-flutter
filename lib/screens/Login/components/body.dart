import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/Components/rounded_button.dart';
import 'package:sp_shop_app/Components/rounded_input_field.dart';
import 'package:sp_shop_app/components/have_already_an_account.dart';
import 'package:sp_shop_app/components/rounded_password_field.dart';
import 'package:sp_shop_app/screens/ForgetPassword/forget_password_screen.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:sp_shop_app/screens/Login/components/background.dart';
import 'package:sp_shop_app/screens/SignUp/sign_up_screen.dart';
import 'package:sp_shop_app/controllers/auth_controller.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    void _login() {
      authController.login();
    }

    void _loginByGoogleEmail() {
      authController.handleSignIn();
    }

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Constants.LOGIN.toUpperCase(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            Image.asset("assets/img/logo.png", height: size.height * 0.15),
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundedInputField(
              labelText: Constants.EMAIL,
              hintText: Constants.EMAIL,
              icon: Icon(Icons.email),
              onChanged: (value) {
                authController.username.value = value;
              },
            ),
            RoundedPasswordField(
              labelText: Constants.PASSWORD,
              hintText: Constants.PASSWORD,
              onChanged: (value) {
                authController.password.value = value;
              },
            ),
            RoundedButton(press: _login, text: Constants.LOGIN),
            HaveAlreadyAnAccountCheck(
              press: () {
                Get.to(ForgetPasswordScreen());
              },
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(press: () {
                Get.to(SignUpScreen());
              }, text: Constants.SIGN_UP),
            // RoundedButton(
            //   press: () {
            //     _loginByGoogleEmail();
            //   },
            //   text: Constants.LOGIN_GOOGLE,
            //   color: blueColor,
            // ),
            
          ],
        ),
      ),
    );
  }
}
