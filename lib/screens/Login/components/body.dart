import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/Components/rounded_button.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:sp_shop_app/screens/Home/home_screen.dart';
import 'package:sp_shop_app/screens/Login/components/background.dart';
import 'package:sp_shop_app/screens/SignUp/sign_up_screen.dart';
import '../../../Components/have_already_an_account.dart';
import '../../../Components/rounded_input_field.dart';
import '../../../Components/rounded_password_field.dart';
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

    Size size = MediaQuery.of(context).size;
    return Background(
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
          Image.asset("assets/img/logo.png", height: size.height * 0.2),
          SizedBox(
            height: size.height * 0.1,
          ),
          RoundedInputField(
            hintText: Constants.EMAIL,
            icon: Icon(Icons.email),
            onChanged: (value) {
              authController.username.value = value;
            },
          ),
          RoundedPasswordField(
            hintText: Constants.PASSWORD,
            onChanged: (value) {
              authController.password.value = value;
            },
          ),
          RoundedButton(
              press:_login,
              text: Constants.LOGIN),
          RoundedButton(
            press: () {
              print(authController.username.value);
            },
            text: Constants.LOGIN_GOOGLE,
            color: blueColor,
          ),
          HaveAlreadyAnAccountCheck(
            press: () {
              Get.to(SignUpScreen());
            },
          )
        ],
      ),
    );
  }
}