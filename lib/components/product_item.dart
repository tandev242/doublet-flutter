import 'package:flutter/material.dart';
import 'package:sp_shop_app/entities/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              product.productPictures[0],
              height: 160,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              product.name,
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
                  height: 17, color: const Color(0xffffffff)),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text("₫" + product.price.toString(),
                style: const TextStyle(
                    color: Color(0xff181725),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
          ),
        )
      ],
    );
  }
}
