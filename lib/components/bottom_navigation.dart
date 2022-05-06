import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/controllers/bottom_nav_controller.dart';
import 'package:sp_shop_app/screens/Cart/cart_screen.dart';
import 'package:sp_shop_app/screens/Explore/explore_screen.dart';
import 'package:sp_shop_app/screens/Home/home_screen.dart';
import 'package:sp_shop_app/screens/Profile/profile_screen.dart';
import 'package:sp_shop_app/utils/constants.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  final BottomNavController _bottomNavController =
      Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 7.0,
        color: Colors.white,
        child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Obx(
                  () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _bottomNavController.setTab(Constants.EXPLORE_SCREEN);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ExploreScreen();
                            }));
                          },
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            color: Colors.white,
                            child: Icon(
                              Icons.explore,
                              color: _bottomNavController.currentTab.toString() == Constants.EXPLORE_SCREEN ? Colors.orange : Colors.grey,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _bottomNavController.setTab(Constants.HOME_SCREEN);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                          },
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            color: Colors.white,
                            child: Icon(
                              Icons.home_rounded,
                              color: _bottomNavController.currentTab.toString() == Constants.HOME_SCREEN ? Colors.orange : Colors.grey,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _bottomNavController.setTab(Constants.CART_SCREEN);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CartScreen();
                            }));
                          },
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            color: Colors.white,
                            child: Icon(
                              Icons.shopping_cart,
                              color: _bottomNavController.currentTab.toString() == Constants.CART_SCREEN ? Colors.orange : Colors.grey,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _bottomNavController.setTab(Constants.PROFILE_SCREEN);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProfileScreen();
                            }));
                          },
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            color: Colors.white,
                            child: Icon(
                              Icons.account_circle,
                              color: _bottomNavController.currentTab.toString() == Constants.PROFILE_SCREEN ? Colors.orange : Colors.grey,
                            ),
                          ),
                        ),
                      ]),
                ))));
  }
}
