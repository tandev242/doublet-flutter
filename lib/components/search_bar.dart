import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:sp_shop_app/utils/constants.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: _searchText,
      style: cExploreSearchTextStyle,
      onChanged: (value) {
        _searchText.text = value;
      },
      decoration: InputDecoration(
          filled: true,
          hintText: Constants.SEARCH_TEXT,
          hintStyle: cExploreSearchHintStyle,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 0.0, style: BorderStyle.none)),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            // Icon to
            color: Colors.grey,
            icon: SvgPicture.asset("assets/icons/delete.svg"),
            onPressed: () {
              _searchText.text = "";
            },
          )),
    );
  }
}
