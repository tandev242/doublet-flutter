import 'package:flutter/material.dart';
import 'package:sp_shop_app/size_config.dart';
import 'package:sp_shop_app/utils/constants.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  final String email;

  const OtpScreen({Key? key, required this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(Constants.OTP_VERIFICATION),
        centerTitle: true,
      ),
      body: Body(email: email,),
    );
  }
}
