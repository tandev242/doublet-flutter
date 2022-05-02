import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/entities/order.dart';
import 'package:intl/intl.dart';
import 'package:sp_shop_app/screens/ProductDetail/product_detail_screen.dart';

class OrderList extends StatelessWidget {
  OrderList({
    Key? key,
    required this.orders,
  }) : super(key: key);

  List orders;

  String formatDateTime(time) {
    DateTime parsedTime = DateTime.parse(time);
    return DateFormat('yyyy-MM-dd – kk:mm').format(parsedTime);
  }

  String getLastStatus(status) {
    for (int i = status.length - 1; i >= 0; i--) {
      if (status[i].isCompleted) {
        return status[i].type;
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Obx(() => Column(children: [
              for (int i = 0; i < orders.length; i++)
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(0, 3),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Mã: ' + orders[i].id.substring(18, 24),
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            Text(formatDateTime(orders[i].createdAt),
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13)),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        for (int j = 0; j < orders[i].items.length; j++)
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    orders[i]
                                        .items[j]
                                        .product
                                        .productPictures[0],
                                    width: width / 4,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: width / 2,
                                          child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProductDetailScreen(
                                                                slug: orders[i]
                                                                    .items[j]
                                                                    .product
                                                                    .slug)));
                                              },
                                              child: Text(
                                                  orders[i]
                                                      .items[j]
                                                      .product
                                                      .name,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18)))),
                                      Text(
                                          'Size: ' +
                                              orders[i].items[j].size.name,
                                          style: TextStyle(
                                              color: Colors.blue[700],
                                              fontSize: 15)),
                                      Text(
                                          'Số lượng : ' +
                                              orders[i]
                                                  .items[j]
                                                  .purchaseQty
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.blue[700],
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 15))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: List.generate(
                              600 ~/ 10,
                              (index) => Expanded(
                                    child: Container(
                                      color: index % 2 == 0
                                          ? Colors.transparent
                                          : Colors.grey,
                                      height: 2,
                                    ),
                                  )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Tổng tiền: ' +
                                    orders[i].totalAmount.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Text(orders[i].paymentType.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Text(getLastStatus(orders[i].orderStatus),
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ],
                        )
                      ],
                    ))
            ])));
  }
}
