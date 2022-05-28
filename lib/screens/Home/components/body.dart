import 'package:flutter/material.dart';
import 'package:sp_shop_app/components/product_list.dart';
import 'package:sp_shop_app/components/search_bar.dart';
import 'package:sp_shop_app/screens/Home/components/background.dart';
import 'package:sp_shop_app/screens/SeeMore/see_more_screen.dart';

class Body extends StatelessWidget {
  Body(
      {Key? key,
      required this.recommendedProducts,
      required this.featuredProducts})
      : super(key: key);

  List recommendedProducts;
  List featuredProducts;

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        SearchBar(),
        const SizedBox(height: 10.0),
        Image.asset(
          'assets/img/grizman.jpg',
          width: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Đề xuất cho bạn',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SeeMoreScreen(
                        name: "Đề xuất cho bạn", type: "recommend");
                  }));
                },
                child: const Text('Xem thêm',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w900)))
          ],
        ),
        const SizedBox(height: 10),
        ProductList(products: recommendedProducts),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sản phẩm hot',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SeeMoreScreen(
                          name: "Sản phẩm hot", type: "featured");
                    }));
                  },
                  child: const Text('Xem thêm',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900)))
            ],
          ),
        ),
        const SizedBox(height: 10),
        ProductList(products: featuredProducts),
      ],
    ));
  }
}
