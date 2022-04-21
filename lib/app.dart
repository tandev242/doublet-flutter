import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/screens/Login/login_screen.dart';
import 'package:sp_shop_app/screens/SignUp/sign_up_screen.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:sp_shop_app/screens/Cart/cart_screen.dart';
import 'package:sp_shop_app/screens/Explore/explore_screen.dart';
import 'package:sp_shop_app/screens/Profile/profile_screen.dart';
import 'package:sp_shop_app/screens/Welcome/welcome_screen.dart';
import 'package:sp_shop_app/screens/Home/home_screen.dart';
import 'package:sp_shop_app/screens/Collection/collection_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'DoubleT shop',
      theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.white),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home:  HomeScreen(),
      home: WelcomeScreen(),
      routes: <String, WidgetBuilder>{
        Constants.PROFILE_SCREEN: (BuildContext context) => ProfileScreen(),
        Constants.HOME_SCREEN: (BuildContext context) => HomeScreen(),
        Constants.EXPLORE_SCREEN: (BuildContext context) => ExploreScreen(),
        Constants.CART_SCREEN: (BuildContext context) => CartScreen(),
        Constants.WELCOME_SCREEN: (BuildContext context) => WelcomeScreen(),
        Constants.LOGIN_SCREEN: (BuildContext context) => LoginScreen(),
        Constants.SIGNUP_SCREEN: (BuildContext context) => SignUpScreen(),
      },
    );
  }
}
