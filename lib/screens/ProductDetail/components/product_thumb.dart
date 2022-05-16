import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/controllers/product_controller.dart';
import 'package:sp_shop_app/entities/product.dart';
import 'package:flutter/material.dart';

class ProductThumb extends StatefulWidget {
  ProductThumb({Key? key, required this.product}) : super(key: key);
  Product product;

  @override
  ProductThumbState createState() => ProductThumbState();
}

class ProductThumbState extends State<ProductThumb> {
  bool _open = true;

  void _openExpansionTile(bool value) {
    setState(() {
      _open = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Product product = widget.product;
    ProductController _productController = Get.put(ProductController());
    return Column(children: [
      Container(
        height: 300,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(product.productPictures.isNotEmpty
                  ? product.productPictures[0]
                  : 'https://res.cloudinary.com/dmtopd6ps/image/upload/v1652685996/webcolours-unknown_jthziz.png'),
              fit: BoxFit.contain),
          color: const Color(0xffF2F3F2),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            alignment: Alignment.center,
            child: Image.network(product.productPictures.isNotEmpty
                ? product.productPictures[0]
                : 'https://res.cloudinary.com/dmtopd6ps/image/upload/v1652685996/webcolours-unknown_jthziz.png'),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(product.name,
                      overflow: TextOverflow.visible,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/heart.svg'))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Nike brand",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xff7C7C7C),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              _productController.onChangeQuantity(-1);
                            },
                            icon: SvgPicture.asset('assets/icons/eksi.svg')),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: const Color(0xffE2E2E2),
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(17)),
                          ),
                          child: Center(
                              child: Text(_productController.quantitySelected
                                  .toString())),
                        ),
                        IconButton(
                            onPressed: () {
                              _productController.onChangeQuantity(1);
                            },
                            icon: SvgPicture.asset('assets/icons/arti.svg')),
                      ],
                    )),
                Text(
                  'đ' + product.price.toString(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ExpansionTile(
              trailing: _open
                  ? SvgPicture.asset('assets/icons/backarrow.svg')
                  : const Icon(Icons.keyboard_arrow_down,
                      size: 32, color: Colors.black),
              onExpansionChanged: _openExpansionTile,
              tilePadding: const EdgeInsets.only(right: 20),
              expandedAlignment: Alignment.topLeft,
              iconColor: Colors.black,
              title: const Text(
                'Description',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff181725),
                    fontWeight: FontWeight.w900),
              ),
              children: <Widget>[
                Text(
                  product.description ?? '',
                  style: const TextStyle(
                      color: Color(0xff7C7C7C),
                      fontSize: 13,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sizes",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Color(0xffEBEBEB),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: const Center(
                        child: Text(
                          "[37], [38], [39]",
                          style: TextStyle(
                              color: Color(0xff7C7C7C),
                              fontSize: 9,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/backarrow.svg'))
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Review",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                ),
                Row(
                  children: [
                    Image.asset("assets/img/star.png"),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/backarrow.svg'))
                  ],
                )
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 70,
      ),
    ]);
  }
}
