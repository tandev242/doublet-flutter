import 'package:flutter/material.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:sp_shop_app/screens/SignUp/components/background.dart';
import 'package:sp_shop_app/screens/SignUp/components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}

