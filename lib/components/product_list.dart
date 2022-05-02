import 'package:get/get.dart';
import 'package:sp_shop_app/components/product_item.dart';
import 'package:sp_shop_app/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:sp_shop_app/screens/ProductDetail/product_detail_screen.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key, required this.products}) : super(key: key);
  List products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 280,
        child: Obx(() => ListView.builder(
              scrollDirection: Axis.horizontal,
              cacheExtent: 280,
              itemExtent: 200,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailScreen(
                                slug: products[index].slug);
                          },
                        ),
                      );
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
                          padding: const EdgeInsets.only(
                              top: 10.0, right: 10.0, left: 10.0),
                          child: ProductItem(product: products[index])),
                    ),
                  ),
                );
              },
            )));
  }
}
