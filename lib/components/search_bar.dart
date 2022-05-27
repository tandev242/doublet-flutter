import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/controllers/product_controller.dart';
import 'package:sp_shop_app/utils/constants.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final TextEditingController _searchText = TextEditingController();
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: _searchText,
      style: cExploreSearchTextStyle,
      onChanged: (value) {
        _searchText.text = value;
        _searchText.selection = TextSelection.fromPosition(TextPosition(offset: _searchText.text.length));
      },
      decoration: InputDecoration(
          filled: true,
          hintText: Constants.SEARCH_TEXT,
          hintStyle: cExploreSearchHintStyle,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 0.0, style: BorderStyle.none)),
          prefixIcon: IconButton(
              // Icon tor
              color: Colors.grey,
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                if (_searchText.text.isNotEmpty) {
                  _productController.getProductsSearched(_searchText.text);
                }
              }),
          suffixIcon: IconButton(
            // Icon tor
            color: Colors.grey,
            icon: SvgPicture.asset("assets/icons/delete.svg"),
            onPressed: () {
              _searchText.text = "";
            },
          )),
    );
  }
}
