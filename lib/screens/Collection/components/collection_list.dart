import 'package:get/get.dart';
import 'package:sp_shop_app/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:sp_shop_app/screens/ProductDetail/product_detail_screen.dart';

class CollectionList extends StatelessWidget {
  CollectionList({Key? key, required this.products}) : super(key: key);

  final List products;

  int limitOfItemCount = 21;
  int getLengthOfProducts() {
    int length = limitOfItemCount;
    if (products.isNotEmpty) {
      length = products.length;
      length = length > 20 ? 20 : length;
    }
    return length;
  }

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
          itemCount: getLengthOfProducts(),
          itemBuilder: (BuildContext ctx, index) {
            if(getLengthOfProducts() == limitOfItemCount){
              return Container();
            }
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
