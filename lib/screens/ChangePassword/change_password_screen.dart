import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/rounded_button.dart';
import 'package:sp_shop_app/components/rounded_password_field.dart';
import 'package:sp_shop_app/controllers/auth_controller.dart';
import 'package:sp_shop_app/screens/Login/components/background.dart';
import 'package:sp_shop_app/utils/constants.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    void changePass() {
      authController.changePassword();
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.EDIT_PASSWORD),
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
                SizedBox(height: 20.0),
                RoundedPasswordField(
                    hintText: 'Mật khẩu hiện tại',
                    labelText: "Mật khẩu hiện tại",
                    onChanged: (value) {
                      authController.currentPass.value = value;
                    }),
                RoundedPasswordField(
                    hintText: 'Mật khẩu mới',
                    labelText: "Mật khẩu mới",
                    onChanged: (value) {
                      authController.newPass.value = value;
                    }),
                RoundedPasswordField(
                    hintText: 'Xác nhận mật khẩu',
                    labelText: "Xác nhận mật khẩu",
                    onChanged: (value) {
                      authController.confirmPass.value = value;
                    }),
                SizedBox(height: 100.0),
                RoundedButton(press: changePass, text: "Xác nhận thay đổi")
              ]),
        ),
      ),
    );
  }
}
