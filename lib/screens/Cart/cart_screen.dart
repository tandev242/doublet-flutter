import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/product_card.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';
import 'package:sp_shop_app/controllers/shopping_controller.dart';
import 'package:sp_shop_app/screens/Cart/components/cart_items.dart';
class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shopping Cart GetX'),
        backgroundColor: Colors.teal[300],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
                children: [
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: GetX<ShoppingController>(
                        builder: (controller) {
                          return ListView.builder(
                            itemCount: controller.products.length,
                            itemBuilder: (context, index){
                              return ProductCard(
                                name: controller.products[index].name,
                                description: controller.products[index].description,
                                price: controller.products[index].price,
                                addToCartFunc: (){
                                  cartController.addToCart(controller.products[index]);
                                },
                              );
                            },
                          );
                        }
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  GetX<CartController>(
                      builder: (controller) {
                        return Text('Total Amount:\t\$ ${controller.totalPrice}',
                            style: const TextStyle(
                                fontSize: 20.0,fontWeight: FontWeight.bold,
                                color: Colors.white));
                      }
                  ),
                  const SizedBox(height: 70.0)
                ]
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: GetX<CartController>(
          builder: (controller){
            return Text('${cartController.itemCount}',
              style: const TextStyle(
              fontSize: 18.0
            ),);
          },
        ),
        backgroundColor: Colors.amber,
        icon: const Icon(Icons.add_shopping_cart_rounded,color: Colors.white,),
        onPressed: (){
          showDialog(
              context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return const AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              scrollable: true,
              content: CartItems(),
            );
          });
        }
      ),
    );
  }
}