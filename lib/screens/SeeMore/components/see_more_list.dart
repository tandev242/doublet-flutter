import 'package:get/get.dart';
import 'package:sp_shop_app/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:sp_shop_app/screens/ProductDetail/product_detail_screen.dart';

class SeeMoreList extends StatelessWidget {
  const SeeMoreList({Key? key, required this.products}) : super(key: key);

  final List products;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisExtent: 280,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: products.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(slug: products[index].slug)));
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: const Color(0xffE2E2E2),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ProductItem(product: products[index])),
              ),
            );
          },
        ));
  }
}
