import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';
import 'package:sp_shop_app/controllers/product_controller.dart';
import 'package:sp_shop_app/screens/ProductDetail/components/product_thumb.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.slug}) : super(key: key);

  final String slug;
  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {

  final ProductController _productController = Get.put(ProductController());
  final CartController _cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    _productController.getProduct(widget.slug);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.file_upload_outlined),
              color: Colors.black,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Align(
              alignment: Alignment.center,
              child: Obx(() => ProductThumb(product: _productController.productBySlug.value))),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: const Color(0xff53B175),
              fixedSize: const Size(double.infinity, 67),
              padding: const EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19.0),
              ),
            ),
            onPressed: () {
              Object cartItem = {
                  "product": _productController.productBySlug.value.id.toString(),
                  "size": "6128b9993483fd6e2401b4e8",
                  "quantity": _cartController.getQuantityAfterVerified(_productController.productBySlug.value.id.toString(), "6128b9993483fd6e2401b4e8", _productController.quantitySelected)
                };
                _cartController.addToCart(cartItem);
            },
            child: const SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  "Add To Basket",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: BottomNavigation());
  }
}
