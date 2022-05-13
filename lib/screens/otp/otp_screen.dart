import 'package:flutter/material.dart';
import 'package:sp_shop_app/size_config.dart';
import 'package:sp_shop_app/utils/constants.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(Constants.OTP_VERIFICATION),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
