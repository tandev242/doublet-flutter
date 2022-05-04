import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';
import 'package:sp_shop_app/entities/product.dart';

class ProductItem extends StatelessWidget {
  ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;
  final CartController _cartController = Get.put(CartController());

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
              onPressed: () {
                Object cartItem = {
                  "product": product.id.toString(),
                  "size": "6128b9993483fd6e2401b4e8",
                  "quantity": _cartController.getQuantityAfterVerified(product.id.toString(), "6128b9993483fd6e2401b4e8")
                };
                _cartController.addToCart(cartItem);
              },
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
