import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';
import 'package:sp_shop_app/screens/Cart/components/cart_item.dart';
import 'package:sp_shop_app/screens/Checkout/checkout_screen.dart';
import 'package:sp_shop_app/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.minHeight,
    required CartController cartController,
  }) : _cartController = cartController, super(key: key);

  final double minHeight;
  final CartController _cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      onPressed: () {
                        if(_cartController.picked.length > 0) {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CheckoutScreen();
                        }));
                        }else{
                          Get.defaultDialog(
                            title: "Cảnh báo",
                            titleStyle:
                                TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                            middleText: "Bạn phải chọn sản phẩm cần thanh toán !",
                            textCancel: Constants.OK,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          'Thanh toán',
                        ),
                      ),
                    ),
                  )
                ],
              )))
    ]));
  }
}
