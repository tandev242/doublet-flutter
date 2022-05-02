import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/cart_api.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';
import 'package:sp_shop_app/utils/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List picked = [];
  int totalAmount = 0;
  final CartController _cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    _cartController.getCart();
  }

  pickToggle(index) {
    setState(() {
      if (picked.contains(index)) {
        picked.remove(index);
      } else {
        picked.add(index);
      }
      getTotalAmount();
    });
  }

  getTotalAmount() {
    setState(() {
      totalAmount = 50000 * picked.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Giỏ hàng',
            style: cMainTitleStyle,
          ),
          centerTitle: true,
        ),
        body: ListView(shrinkWrap: true, children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(children: [
                  Stack(children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height - 50.0,
                      width: double.infinity,
                    ),
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
                                  itemCard(
                                      _cartController.cartItems[i].product.name,
                                      _cartController.cartItems[i].size.name,
                                      _cartController.cartItems[i].product.price
                                          .toString(),
                                      _cartController.cartItems[i].product
                                          .productPictures[0],
                                      true,
                                      i),
                              ],
                            ))),
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
                            Text('Total: \$' + totalAmount.toString()),
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
              ])
        ]),
        bottomNavigationBar: BottomNavigation());
  }

  Widget itemCard(itemName, size, price, imgPath, available, i) {
    return InkWell(
      onTap: () {
        if (available) {
          pickToggle(i);
        }
      },
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10.0),
          child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 3.0,
              child: Container(
                  padding: EdgeInsets.only(left: 15.0, right: 10.0),
                  width: MediaQuery.of(context).size.width - 20.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                color: available
                                    ? Colors.grey.withOpacity(0.4)
                                    : Colors.red.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(12.5),
                              ),
                              child: Center(
                                  child: available
                                      ? Container(
                                          height: 12.0,
                                          width: 12.0,
                                          decoration: BoxDecoration(
                                              color: picked.contains(i)
                                                  ? Colors.yellow
                                                  : Colors.grey
                                                      .withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(6.0)),
                                        )
                                      : Container()))
                        ],
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 150.0,
                        width: 110.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imgPath),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(width: 15.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width - 220,
                                child: Text(itemName,
                                    maxLines: 2,
                                    overflow: TextOverflow.visible,
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(width: 7.0)
                            ],
                          ),
                          SizedBox(height: 7.0),
                          available
                              ? Text(
                                  'Size: ' + size,
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Colors.grey),
                                )
                              : OutlineButton(
                                  onPressed: () {},
                                  borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1.0,
                                      style: BorderStyle.solid),
                                  child: Center(
                                    child: Text('Find Similar',
                                        style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0,
                                            color: Colors.red)),
                                  ),
                                ),
                          SizedBox(height: 7.0),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                available
                                    ? Text(
                                        price,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Color.fromARGB(
                                                255, 255, 97, 24)),
                                      )
                                    : Container(),
                                SizedBox(width: 20.0),
                                available
                                    ? picked.contains(i)
                                        ? Text(
                                            'x1',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 20.0,
                                                color: Colors.black),
                                          )
                                        : Container()
                                    : Container()
                              ]),
                        ],
                      )
                    ],
                  )))),
    );
  }
}
