import 'package:flutter/material.dart';
import 'package:sp_shop_app/components/rounded_button.dart';
import 'package:sp_shop_app/components/rounded_password_field.dart';
import 'package:sp_shop_app/screens/Login/components/background.dart';
import 'package:sp_shop_app/utils/constants.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          RoundedPasswordField(
              hintText: 'Mật khẩu hiện tại',
              labelText: "Mật khẩu hiện tại",
              onChanged: (value) {}),
          RoundedPasswordField(
              hintText: 'Mật khẩu mới',
              labelText: "Mật khẩu mới",
              onChanged: (value) {}),
          RoundedPasswordField(
              hintText: 'Xác nhận mật khẩu',
              labelText: "Xác nhận mật khẩu",
              onChanged: (value) {}),
          SizedBox(height: 100.0),
          RoundedButton(press: () {}, text: "Xác nhận thay đổi")
        ]),
      ),
    );
  }
}
