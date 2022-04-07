import 'package:sp_shop_app/components/product_item.dart';
import 'package:sp_shop_app/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:sp_shop_app/screens/ProductDetail/product_detail.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.futureProducts}) : super(key: key);
  final Future<List<dynamic>> futureProducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: FutureBuilder<List<dynamic>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List? products = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              cacheExtent: 280,
              itemExtent: 200,
              itemCount: products?.length,
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
                                slug: products![index].slug);
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
                          child: ProductItem(product: products![index])),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(
                  child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: CircularProgressIndicator(
                  value: null,
                  strokeWidth: 7.0,
                ),
              ))
            ]);
        },
      ),
    );
  }
}
