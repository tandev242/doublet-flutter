import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sp_shop_app/apis/order_api.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/screens/MyOrders/components/order_list.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  MyOrdersScreenState createState() => MyOrdersScreenState();
}

class MyOrdersScreenState extends State<MyOrdersScreen> {
  late final Future<List> futureOrders;

  @override
  void initState() {
    super.initState();
    futureOrders = OrderApi.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.transparent,
              title: Text(Constants.MY_ORDERS_TITLE),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/filter.svg"))
              ],
              bottom: PreferredSize(
                child: Container(
                  color: Color(0xffE2E2E2),
                  height: 1.0,
                ),
                preferredSize: Size.fromHeight(4),
              ),
              titleTextStyle: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: cTextColor),
            ),
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: DefaultTabController(
                  length: 5,
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ButtonsTabBar(
                        backgroundColor: Color(0xff00e676),
                        unselectedBackgroundColor: Colors.grey[300],
                        unselectedLabelStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(
                            text: "Tất cả",
                          ),
                          Tab(
                            text: "Đang xử lí",
                          ),
                           Tab(
                            text: "Đã đóng gói",
                          ),
                          Tab(
                            text: "Đang vận chuyển",
                          ),
                          Tab(
                            text: "Giao thành công",
                          ),
                        ],
                      ),
                      Expanded(
                          child: TabBarView(
                        children: [
                          OrderList(futureOrders: futureOrders),
                          OrderList(futureOrders: futureOrders),
                          OrderList(futureOrders: futureOrders),
                          OrderList(futureOrders: futureOrders),
                          OrderList(futureOrders: futureOrders)
                        ],
                      ))
                    ],
                  )),
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigation()));
  }
}
