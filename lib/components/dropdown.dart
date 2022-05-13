import 'package:flutter/material.dart';
import 'package:sp_shop_app/utils/constants.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({
    Key? key,
    required this.items,
    required this.onChange, 
    required this.value,
  }) : super(key: key);

  final List<String> items;
  final String value;
  final Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    DropdownMenuItem<String> builderMenuitem(String item) => DropdownMenuItem(
          value: item,
          child: Text(item, style: TextStyle(fontSize: 16)),
        );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kPrimaryColor, width: 1)),
      child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          items: items.map(builderMenuitem).toList(),
          onChanged: onChange),
    );
  }
}
