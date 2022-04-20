import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.price,
      this.addToCartFunc})
      : super(key: key);
  final String name;
  final String description;
  final double price;
  final Function()? addToCartFunc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.teal[300]),
                ),
                Text(description, style: const TextStyle(fontSize: 16.0)),
              ]),
              Text('\$ $price', style: const TextStyle(fontSize: 24.0))
            ]),
            ElevatedButton(
                onPressed: addToCartFunc,
                child: const Text('Add To Cart'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal[300]),
                )),
          ]),
        ),
      ),
    );
  }
}
