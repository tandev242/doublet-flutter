import 'package:flutter/material.dart';
import 'package:sp_shop_app/Constants/constants.dart';
import 'package:sp_shop_app/components/product_list.dart';
import 'package:sp_shop_app/entities/product.dart';
import 'package:sp_shop_app/screens/Home/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.futureProducts}) : super(key: key);

  final Future<List<dynamic>> futureProducts;

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
            hintText: 'Input search text',
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
            const Text('Hot Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            TextButton(
                onPressed: () {},
                child: const Text('See all',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w900)))
          ],
        ),
        const SizedBox(height: 10),
        ProductList(futureProducts: futureProducts),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Featured Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text('See all',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900)))
            ],
          ),
        ),
        const SizedBox(height: 10),
        ProductList(futureProducts: futureProducts),
      ],
    ));
  }
}
