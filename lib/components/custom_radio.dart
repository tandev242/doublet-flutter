import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/controllers/product_controller.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({Key? key}) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ProductController _productController = Get.put(ProductController());
    List<String> sizes = _productController.getListSizesByProduct();
    List<String> lst = [];

    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            ListView(
              children: [
                customR(lst[0], 0),
                customR(lst[1], 1),
                customR(lst[2], 2),
                customR(lst[3], 3),
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customR(String desc, int index) {
    return OutlinedButton(
        onPressed: () {
          changeIndex(index);
        },
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            side: BorderSide(
                color: selectedIndex == index
                    ? Colors.red
                    : Color.fromARGB(255, 59, 58, 58))),
        child: Text(desc, style: TextStyle()));
  }
}
