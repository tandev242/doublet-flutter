import 'package:flutter/material.dart';
import 'package:sp_shop_app/utils/constants.dart';
class HaveAlreadyAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function()? press;
  const HaveAlreadyAnAccountCheck({
    Key? key, 
    this.login = false, 
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? Constants.HAVE_AN_ACCOUNT : '',
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? Constants.LOGIN : Constants.FORGET_PASSWORD,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
