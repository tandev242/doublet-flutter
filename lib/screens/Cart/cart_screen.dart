import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';
import 'package:sp_shop_app/screens/Cart/components/cart_item.dart';
import 'package:sp_shop_app/utils/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController _cartController = Get.put(CartController());
  @override
  void initState() {
    super.initState();
    _cartController.getCart();
  }

  @override
  Widget build(BuildContext context) {
    var minHeight = MediaQuery.of(context).size.height - 50;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text('Giỏ hàng'),
          centerTitle: true,
        ),
        body: Container(
            child: Stack(children: <Widget>[
          ListView(shrinkWrap: true, children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(children: [
                    Stack(children: <Widget>[
                      Obx(() => Container(
                            height: minHeight >
                                    165 *
                                        _cartController.cartItems.length
                                            .toDouble()
                                ? minHeight
                                : 165 *
                                    _cartController.cartItems.length.toDouble(),
                            width: double.infinity,
                          )),
                      Container(
                        height: 100.0,
                        width: double.infinity,
                        color: Color(0xFFFDD148),
                      ),
                      Positioned(
                        bottom: 450.0,
                        right: 100.0,
                        child: Container(
                          height: 400.0,
                          width: 400.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200.0),
                            color: Color(0xFFFEE16D),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 200.0,
                        left: 150.0,
                        child: Container(
                            height: 300.0,
                            width: 300.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150.0),
                                color: Color(0xFFFEE16D).withOpacity(0.5))),
                      ),
                      Positioned(
                          top: 20.0,
                          child: Obx(() => Column(
                                children: [
                                  for (int i = 0;
                                      i < _cartController.cartItems.length;
                                      i++)
                                    CartItemCard(
                                        item: _cartController.cartItems[i],
                                        available: true),
                                ],
                              ))),
                    ])
                  ]),
                ])
          ]),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 50.0,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() => Text('Total: \$' +
                          _cartController.totalAmount.toString())),
                      SizedBox(width: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              'Pay Now',
                            ),
                          ),
                        ),
                      )
                    ],
                  )))
        ])),
        bottomNavigationBar: BottomNavigation());
  }
}
