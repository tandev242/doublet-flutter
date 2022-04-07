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
                                slug:
                                    'NIKE-Lunar-Legend-7-Pro-IC-Always-Forward-Racer-BlueBlack-143ey0Wed_');
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
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  products?[index].productPictures[0],
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  products![index].name,
                                  style: const TextStyle(
                                      color: Color(0xff181725),
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: SizedBox(
                                width: 45,
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.black,
                                    primary: const Color(0xff53B175),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17.0),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Image.asset('assets/img/plus_sign.png',
                                      height: 17,
                                      color: const Color(0xffffffff)),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                    "₫" + products[index].price.toString(),
                                    style: const TextStyle(
                                        color: Color(0xff181725),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const SizedBox(
            height: 50.0,
            width: 50.0,
            child: CircularProgressIndicator(
              value: null,
              strokeWidth: 7.0,
            ),
          );
        },
      ),
    );
  }
}
