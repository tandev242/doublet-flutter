import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/dropdown.dart';
import 'package:sp_shop_app/components/rounded_button.dart';
import 'package:sp_shop_app/controllers/checkout_controller.dart';
import 'package:sp_shop_app/controllers/delivery_info_controller.dart';
import 'package:sp_shop_app/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.items,
    required this.c,
    required this.d,
  }) : super(key: key);

  final List<String> items;
  final CheckoutController c;
  final DeliveryInfoController d;

  @override
  Widget build(BuildContext context) {
    // PaymentType? _type = c.type.value;
    // var listDelivery = d.getDeliveryInfo();
    int itemCount = 3;
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
                        height: itemCount < 2 ? 140.0 : 320.0,
                        child: ListView(
                          children: <Widget>[
                            dummyDataOfListView("assets/img/Nike_Shoe_PNG.png",
                                "Women T-Shirt", "Cloths", "500Rs", 4),
                            dummyDataOfListView("assets/img/Nike_Shoe_PNG.png",
                                "Women T-Shirt", "Cloths", "600Rs", 1),
                            dummyDataOfListView("assets/img/Nike_Shoe_PNG.png",
                                "Women T-Shirt", "Cloths", "800Rs", 3),
                            // dummyDataOfListView("assets/img/Nike_Shoe_PNG.png","Women T-Shirt", "Cloths", "100Rs", 4),
                            // dummyDataOfListView("assets/img/Nike_Shoe_PNG.png","Women T-Shirt", "Cloths", "1000Rs", 8),
                            // dummyDataOfListView("assets/img/Nike_Shoe_PNG.png","Women T-Shirt", "Cloths", "5000Rs", 7),
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
                          items: items,
                          value: c.delivery.value,
                          onChange: (value) async {
                            print(value);
                            c.delivery.value = value!;
                            var listDelivery = await d.getDeliveryInfo();
                            print(listDelivery);
                          },
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              Constants.RECEIVE_PEOPLE +
                                  ': ${c.delivery.value}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              Constants.PHONE_NUMBER + ': ${c.delivery.value}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              Constants.RECEIVE_ADDRESS +
                                  ': ${c.delivery.value}',
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
                                "160.00",
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
                                "10.00",
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
                                "170.00",
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
                        Obx(() => Container(
                                child: Column(
                                  
                                  children: <Widget>[
                                    ListTile(
                                      title:
                                          const Text('Thanh toán sau khi nhận hàng'),
                                      leading: Radio<PaymentType>(
                                        value: PaymentType.cod,
                                        groupValue: c.type.value,
                                        onChanged: (PaymentType? value) {
                                          c.type.value = value!;
                                          print(c.type.value);
                                        },
                                      ),
                                    ),
                                    ListTile(
                                        title: const Text('Thanh toán qua ví Momo'),
                                        leading: Radio<PaymentType>(
                                          value: PaymentType.momo,
                                          groupValue: c.type.value,
                                          onChanged: (PaymentType? value) {
                                            c.type.value = value!;
                                            print(c.type.value);
                                          },
                                        ))
                            ])))
                      ],
                    )),
                    RoundedButton(press: (){}, text: "Thanh toán")
              ],
            ))));
  }

  dummyDataOfListView(String imgSrc, String itemName, String itemCategory,
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
            image: AssetImage(imgSrc),
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
                  "Item Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  "Thương hiệu/ Loại ",
                  style: TextStyle(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  "500 VNĐ",
                  style: TextStyle(color: Color(0xff374ABE)),
                ),
              ),
            ],
          ),
        ),

        // Item Add and Remove Container
        subtitle: Container(
            child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (itemCount < 0) {
                  itemCount = 0;
                } else {
                  itemCount--;
                }
              },
              child: Icon(
                Icons.remove,
                size: 19.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 1.0, right: 10.0),
              child: Text(
                itemCount.toString(),
                style: TextStyle(color: Colors.black),
              ),
            ),

            // Add count button
            GestureDetector(
              onTap: () {
                itemCount++;
              },
              child: Icon(
                Icons.add,
                size: 19.0,
              ),
            ),
          ],
        )
      ),
      ),
    ));
  }
}
