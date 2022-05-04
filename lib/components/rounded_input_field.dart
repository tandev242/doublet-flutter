import 'package:flutter/material.dart';
import 'package:sp_shop_app/Components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final Icon? icon;
  final ValueChanged<String>? onChanged;
  final bool isReadOnly;
  final String? labelText;
  final String? initialText;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.isReadOnly = false,
    this.labelText,
    this.initialText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: TextEditingController(text: initialText),
        readOnly: isReadOnly,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          icon: icon,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
