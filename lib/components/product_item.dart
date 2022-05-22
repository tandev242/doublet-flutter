import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';
import 'package:sp_shop_app/controllers/product_controller.dart';
import 'package:sp_shop_app/entities/product.dart';
import 'package:sp_shop_app/utils/constants.dart';

class ProductItem extends StatelessWidget {
  ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;
  final CartController _cartController = Get.put(CartController());
  final ProductController _productController = Get.put(ProductController());

  addToCart(Product product) async {
    await _productController.getProduct(product.slug);
    _productController.addToCart(product);
  }

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
            width: 60,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.black,
                primary: kPrimaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0),
                ),
              ),
              onPressed: () {
                addToCart(product);
              },
              // child: Image.asset('assets/img/plus_sign.png',
              //     height: 10, color: const Color(0xffffffff)),
              child: Icon(
                Icons.add,
                color: whiteColor,
              ),
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
