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
    List sizes = _productController.productBySlug.value.sizes;
    List lst = ["1", "2", "3", "4", "5", "6"];

    void changeIndex(int index) {
      setState(() {
        selectedIndex = index;
        _productController.sizeSelected.value = sizes[index].id;
        print(_productController.sizeSelected.value);
      });
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          for (int i = 0; i < sizes.length; i++)
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: OutlinedButton(
                    onPressed: () {
                      changeIndex(i);
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        side: BorderSide(
                            color: selectedIndex == i
                                ? Colors.red
                                : Color.fromARGB(255, 59, 58, 58))),
                    child: Text(sizes[i].name.toString(),
                        style: TextStyle(
                          fontWeight: selectedIndex == i
                              ? FontWeight.bold
                              : FontWeight.w400,
                          color: selectedIndex == i
                              ? Colors.red
                              : Color.fromARGB(255, 59, 58, 58),
                        ))))
        ],
      ),
    );
  }
}
