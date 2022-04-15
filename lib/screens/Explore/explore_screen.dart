import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sp_shop_app/apis/category_api.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/constants/constants.dart';
import 'package:sp_shop_app/screens/Explore/components/category_list.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchText = TextEditingController();
  late final Future<List> futureCategories;
  @override
  void initState() {
    super.initState();
    futureCategories = CategoryApi.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Khám phá',
            style: cMainTitleStyle,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextField(
                  autofocus: false,
                  controller: _searchText,
                  style: cExploreSearchTextStyle,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Tìm kiếm ',
                      hintStyle: cExploreSearchHintStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 0.0, style: BorderStyle.none)),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                CategoryList(futureCategories: futureCategories)
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
