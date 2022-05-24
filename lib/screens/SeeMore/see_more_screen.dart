import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/controllers/product_controller.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:sp_shop_app/screens/SeeMore/components/see_more_list.dart';

class SeeMoreScreen extends StatelessWidget {
  SeeMoreScreen({Key? key, required this.name, required this.type})
      : super(key: key);
  final String type;
  final String name;
  
  final ProductController _productController = Get.put(ProductController());

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
          title: Text(name),
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
                if(type == "recommend")
                  SeeMoreList(products: _productController.recommendedProducts)
                else
                  SeeMoreList(products: _productController.featuredProducts)
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
