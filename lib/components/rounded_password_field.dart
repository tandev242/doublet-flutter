import 'package:flutter/material.dart';
import 'package:sp_shop_app/Components/text_field_container.dart';
import 'package:sp_shop_app/utils/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final String? labelText;
  const RoundedPasswordField({
    this.hintText,
    this.onChanged,
    this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isSecurePassword = true;

  void setObscureText() {
    setState(() {
      isSecurePassword = !isSecurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: isSecurePassword,
      decoration: InputDecoration(
          hintText: widget.hintText,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          labelText: widget.labelText,
          suffixIcon: IconButton(
              icon: Icon( isSecurePassword ? Icons.visibility : Icons.visibility_off),
              color: kPrimaryColor,
              onPressed: setObscureText
              ),
          border: InputBorder.none),
      onChanged: widget.onChanged,
    ));
  }
}
