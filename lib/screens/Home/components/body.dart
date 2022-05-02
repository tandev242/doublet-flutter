import 'package:flutter/material.dart';
import 'package:sp_shop_app/components/product_list.dart';
import 'package:sp_shop_app/screens/Home/components/background.dart';
import 'package:sp_shop_app/utils/constants.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.hotProducts, required this.featuredProducts}) : super(key: key);

  List hotProducts;
  List featuredProducts;


  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        TextField(
          style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(0, 0, 0, 0),
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            filled: true,
            hintText: Constants.SEARCH_TEXT,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xff7C7C7C)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    const BorderSide(width: 0.0, style: BorderStyle.none)),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Image.asset(
          'assets/img/grizman.jpg',
          width: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sản phẩm mới',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            TextButton(
                onPressed: () {},
                child: const Text('Xem thêm',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w900)))
          ],
        ),
        const SizedBox(height: 10),
        ProductList(products: hotProducts),
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
                  onPressed: () {},
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
