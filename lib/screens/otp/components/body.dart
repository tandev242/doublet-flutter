import 'package:flutter/material.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:sp_shop_app/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  final String email;

  const Body({Key? key, required this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                Constants.OTP_VERIFICATION,
                style: headingStyle,
              ),
              Text("Chúng tôi sẽ gửi mã xác thực qua số email: ",
              textAlign: TextAlign.center),
              Text(email,
              textAlign: TextAlign.center),
              buildTimer(),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  Constants.RESEND_OTP,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Mã xác thực sẽ hết hạn trong "),
        TweenAnimationBuilder(
          tween: Tween(begin: 59.0, end: 0.0),
          duration: Duration(seconds: 59),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
