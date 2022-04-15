import 'package:flutter/material.dart';
import 'package:sp_shop_app/apis/product_api.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/screens/Home/components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late Future<List<dynamic>> futureProducts;
  @override
  void initState() {
    super.initState();
    futureProducts = ProductApi.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 80,
            title: SizedBox(
                child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/img/doublet.png', height: 100),
                  const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "DoubleT sport",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 123, 0),
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ))
                ])
              ],
            ))),
        body: Body(futureProducts: futureProducts),
        bottomNavigationBar: BottomNavigation());
  }
}
