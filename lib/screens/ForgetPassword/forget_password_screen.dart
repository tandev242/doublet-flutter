import 'package:flutter/material.dart';
import 'package:sp_shop_app/components/rounded_button.dart';
import 'package:sp_shop_app/components/rounded_input_field.dart';
import 'package:sp_shop_app/screens/SignUp/components/background.dart';
import 'package:sp_shop_app/utils/constants.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          RoundedInputField(
              hintText: Constants.EMAIL,
              labelText: Constants.EMAIL,
              onChanged: (value) {}),
          SizedBox(height: 100.0),
          RoundedButton(press: (){}, text: "Gửi mã xác nhận")
        ]
        )
      )
    );
  }
}