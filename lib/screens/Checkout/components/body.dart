import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sp_shop_app/components/dropdown.dart';
import 'package:sp_shop_app/components/rounded_button.dart';
import 'package:sp_shop_app/controllers/cart_controller.dart';
import 'package:sp_shop_app/controllers/checkout_controller.dart';
import 'package:sp_shop_app/controllers/delivery_info_controller.dart';
import 'package:sp_shop_app/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CheckoutController _checkoutController =
        Get.put(CheckoutController());
    final DeliveryInfoController _deliveryInfoController =
        Get.put(DeliveryInfoController());
    final CartController _cartController = Get.put(CartController());
    print(_deliveryInfoController.addresses);
    return Container(
        color: Color.fromARGB(255, 245, 230, 232),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: (ListView(
              children: [
                Text(
                  Constants.PRODUCT_LIST_CHECKOUT,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  child: Wrap(
                    children: [
                      Container(
                        height:
                            _cartController.picked.length < 2 ? 140.0 : 320.0,
                        child: ListView(
                          children: <Widget>[
                            for (final item in _cartController.picked)
                              dummyDataOfListView(
                                  item.product.productPictures[0],
                                  item.product.name,
                                  item.size.name,
                                  (item.quantity * item.product.price)
                                      .toString(),
                                  item.quantity),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  Constants.DELIVERY_INFO,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Dropdown(
                          items: _deliveryInfoController.addresses,
                          value: _deliveryInfoController
                              .pickedAddress.value.address,
                          onChange: (value) async {
                            _deliveryInfoController.setPickedAddress(value);
                          },
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              Constants.RECEIVE_PEOPLE +
                                  ': ${_deliveryInfoController.pickedAddress.value.name}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              Constants.PHONE_NUMBER +
                                  ': ${_deliveryInfoController.pickedAddress.value.phoneNumber}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              Constants.RECEIVE_ADDRESS +
                                  ': ${_deliveryInfoController.pickedAddress.value.address}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          Constants.SUMMARY,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  Constants.ORDER_PRICE,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Text(
                                "${_cartController.totalAmount.value} VNĐ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  Constants.SHIPPING_FEE,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Text(
                                "30.000 VNĐ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 30.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  Constants.TOTAL,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "${_cartController.totalAmount.value + 30000} VND",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          Constants.PAYMENT_TYPE,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                            child: Column(children: <Widget>[
                          ListTile(
                            title: const Text('Thanh toán sau khi nhận hàng'),
                            leading: Radio<PaymentType>(
                              value: PaymentType.cod,
                              groupValue: _checkoutController.type.value,
                              onChanged: (PaymentType? value) {
                                _checkoutController.type.value = value!;
                              },
                            ),
                          ),
                          ListTile(
                              title: const Text('Thanh toán qua ví Momo'),
                              leading: Radio<PaymentType>(
                                value: PaymentType.momo,
                                groupValue: _checkoutController.type.value,
                                onChanged: (PaymentType? value) {
                                  _checkoutController.type.value = value!;
                                },
                              ))
                        ]))
                      ],
                    )),
                RoundedButton(
                    press: () {
                      List items = _cartController.picked;
                      String addressId = _deliveryInfoController.pickedAddress.value.id;
                      int totalAmount = _cartController.totalAmount.value + 30000;
                      _checkoutController.purchaseOrder(items, addressId, totalAmount);
                      _cartController.picked.value = [];
                    },
                    text: "Thanh toán")
              ],
            ))));
  }

  dummyDataOfListView(String imgSrc, String itemName, String itemSize,
      String itemPrice, int itemCount) {
    return Container(
        child: Card(
      elevation: 4.0,
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 5.0),
      color: Color(0xffFFFFFF),
      child: ListTile(
        // on ListItem clicked
        onTap: () {},

        // Image of ListItem
        leading: Container(
          child: Image(
            fit: BoxFit.fitHeight,
            image: NetworkImage(imgSrc),
          ),
        ),

        // Lists of titles
        title: Container(
          margin: EdgeInsets.only(top: 10.0),
          height: 80.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 2.0),
                child: Text(
                  itemName,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  "Size: ${itemSize}",
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  "Giá tiền: ${itemPrice}đ",
                  style: TextStyle(color: Color(0xff374ABE), fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),

        // Item Add and Remove Container
        subtitle: Container(
          padding: EdgeInsets.only(left: 10.0, top: 1.0, right: 10.0),
          child: Text(
            "Số lượng:" + itemCount.toString(),
            style: TextStyle(color: Colors.black, fontSize: 12.0),
          ),
        ),
      ),
    ));
  }
}
