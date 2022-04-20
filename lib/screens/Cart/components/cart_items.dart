import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';

class CartItems extends StatelessWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: size.height * (3 / 4),
        width: size.width - 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.close,
                      color: Colors.grey[500],
                    ))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Shopping Cart', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.teal[300])),
              const SizedBox(width: 8.0),
              Chip(
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                  child: GetX<CartController>(builder: (controller) {
                    return Text('${controller.itemCount}', style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold));
                  }),
                ),
                backgroundColor: Colors.amber,
              ),
            ]),
            const SizedBox(height: 10.0),
            GetX<CartController>(builder: (controller) {
              return controller.itemCount == 0
                  ? Expanded(
                      child: Column(children: [
                        Flexible(
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.asset('assets/img/NIKE_SHOE_PNG.png'),
                          ),
                        ),
                        const Text(
                          'No Items',
                          style: TextStyle(fontSize: 21.0),
                        ),
                      ]),
                    )
                  : SizedBox(
                      height: size.height * (3 / 4) - 150.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: controller.itemCount,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              controller.removeFromCart(index);
                            },
                            direction: DismissDirection.endToStart,
                            background: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const <Widget>[
                                      Icon(Icons.delete, color: Colors.white),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                color: Colors.teal,
                                height: 80.0,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Text(
                                          controller.cartItems[index].product!.name,
                                          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800, color: Colors.white),
                                        ),
                                        Text('HAHAHA',
                                            style: const TextStyle(fontSize: 14.0, color: Colors.white)),
                                      ]),
                                      Text('\$ ${controller.cartItems[index].product!.price.toString()}',
                                          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white))
                                    ]),
                                  ]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            }),
            const SizedBox(height: 10.0),
            GetX<CartController>(builder: (controller){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        const Text('Total Price:',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500
                          ),),
                        const SizedBox(width: 5.0),
                        Text('\$ ${controller.totalPrice}',
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),),
                      ]
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: const Text('Checkout',
                      style: TextStyle(
                        fontWeight: FontWeight.w800
                      ),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.teal[300]),
                      )
                  ),
                ]
              );
            },),
          ],
        ),
      ),
    );
  }
}