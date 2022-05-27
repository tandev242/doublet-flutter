import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/components/search_bar.dart';
import 'package:sp_shop_app/controllers/category_controller.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:sp_shop_app/screens/Explore/components/category_list.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final CategoryController _categoryController = Get.put(CategoryController());

  @override
  void initState() {
    super.initState();
    if (_categoryController.categories.isEmpty) {
      _categoryController.getCategories();
    }
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
                SearchBar(),
                const SizedBox(
                  height: 20,
                ),
                CategoryList(categories: _categoryController.categories)
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
