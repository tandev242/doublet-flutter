import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';
import 'package:sp_shop_app/screens/Cart/components/body.dart';
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
        body: Body(minHeight: minHeight, cartController: _cartController),
        bottomNavigationBar: BottomNavigation());
  }
}

