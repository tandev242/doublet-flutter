import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/controllers/product_controller.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:sp_shop_app/screens/Collection/components/collection_list.dart';

class CollectionScreen extends StatefulWidget {
  final String name;
  final String slug;
  const CollectionScreen({Key? key, required this.name, required this.slug})
      : super(key: key);

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final ProductController _productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _productController.getProductsByCategory(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          title: Text(widget.name),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/filter.svg"))
          ],
          bottom: PreferredSize(
            child: Container(
              color: Color(0xffE2E2E2),
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(4),
          ),
          titleTextStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: cTextColor),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 30,
                ),
                CollectionList(products: _productController.productsByCategory)
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
