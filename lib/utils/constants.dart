import 'package:flutter/material.dart';

class Constants {
  static const String HOME_SCREEN = "HOME_SCREEN";
  static const String COLLECTION_SCREEN = "COLLECTION_SCREEN";
  static const String EXPLORE_SCREEN = "EXPLORE_SCREEN";
  static const String PROFILE_SCREEN = "PROFILE_SCREEN";
  static const String PRODUCT_DETAIL_SCREEN = "PRODUCT_DETAIL_SCREEN";
  static const String CART_SCREEN = "CART_SCREEN";
  static const String WELCOME_SCREEN = "WELCOME_SCREEN";


  static const String LOGIN = "Đăng nhập";
  static const String LOGIN_GOOGLE = "Đăng nhập bằng Google";
  static const String EMAIL = "Email";
  static const String PASSWORD = "Mật khẩu";
  static const String SIGN_UP = "Đăng ký";
  static const String HAVE_NOT_AN_ACCOUNT = "Bạn chưa có tài khoản ? ";
  static const String HAVE_AN_ACCOUNT = "Bạn đã có tài khoản ? ";
  static const String CONFIRM_PASSWORD = "Xác thực mật khẩu";
  static const String FULL_NAME = "Họ và tên";
  static const String DOUBLE_T = "DoubleT Sport";
}

const kPrimaryColor = Color.fromARGB(255, 233, 71, 71);
const kPrimaryLightColor = Color.fromARGB(255, 255, 247, 247);
const whiteColor = Color.fromARGB(255, 253, 253, 253);
const blueColor = Color.fromARGB(255, 69, 164, 241);
const cMainColor = Color(0xff53B175);
const cTextColor = Color(0xff181725);
const cWhiteColor = Color(0xffffffff);
const cSubtitleTextColor = Color(0xff7C7C7C);

const List cExploreBackgroundColorLists = [
  [
    Color(0x1053B175),
    Color(0x3053B175),
    Color(0x7053B175),
    Color(0xff53B175),
  ],
  [
    Color(0x10F8A44C),
    Color(0x30F8A44C),
    Color(0x70F8A44C),
    Color(0xffF8A44C),
  ],
  [
    Color(0x10F7A593),
    Color(0x30F7A593),
    Color(0x70F7A593),
    Color(0xffF7A593),
  ],
  [
    Color(0x10D3B0E0),
    Color(0x30D3B0E0),
    Color(0x70D3B0E0),
    Color(0xffD3B0E0),
  ],
  [
    Color(0x10FDE598),
    Color(0x30FDE598),
    Color(0x70FDE598),
    Color.fromARGB(255, 250, 222, 131),
  ],
  [
    Color(0x10B7DFF5),
    Color(0x30B7DFF5),
    Color(0x70B7DFF5),
    Color(0xffB7DFF5),
  ],
  [
    Color(0x15836AF6),
    Color(0x15836AF6),
    Color(0x15836AF6),
    Color(0xff836AF6),
  ],
  [
    Color(0x10D73B77),
    Color(0x30D73B77),
    Color(0x45D73B77),
    Color(0xffD73B77),
  ]
];
const cMainTitleStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: cTextColor);

const cHeadsTextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w900);

const cTextButtonTextStyle =
    TextStyle(color: cMainColor, fontSize: 16, fontWeight: FontWeight.w900);

const cExploreListHeadStyle =
    TextStyle(color: cTextColor, fontSize: 16, fontWeight: FontWeight.bold);
const cExploreSearchTextStyle =
    TextStyle(fontSize: 16, color: cTextColor, fontWeight: FontWeight.bold);
const cExploreSearchHintStyle = TextStyle(
    fontWeight: FontWeight.w700, fontSize: 16, color: cSubtitleTextColor);

const cAccountPageNameTextStyle =
    TextStyle(color: cTextColor, fontWeight: FontWeight.w900, fontSize: 16);
const cAccountPageMailTextStyle =
    TextStyle(color: cTextColor, fontSize: 14, fontWeight: FontWeight.w600);
const cAccountPageTitleStyle =
    TextStyle(color: cTextColor, fontSize: 18, fontWeight: FontWeight.w800);
const cAccountLogoutTextStyle =
    TextStyle(color: cMainColor, fontSize: 18, fontWeight: FontWeight.w800);

const cCartGoToCheckoutButtonTextStyle =
    TextStyle(color: cWhiteColor, fontSize: 18, fontWeight: FontWeight.w800);

const cCartPriceTextStyle =
    TextStyle(color: cTextColor, fontSize: 14.0, fontWeight: FontWeight.w900);

const cCartStockTextStyle =
    TextStyle(color: cTextColor, fontSize: 16, fontWeight: FontWeight.bold);

const cCartKgTextStyle = TextStyle(
    color: cSubtitleTextColor, fontSize: 14, fontWeight: FontWeight.w700);

const cCartProductNameTextStyle =
    TextStyle(color: cTextColor, fontSize: 16, fontWeight: FontWeight.bold);

const cFavouritemAddAllToCartString =
    TextStyle(color: cWhiteColor, fontSize: 18, fontWeight: FontWeight.w800);

const cGroceriesListHeadStyle = TextStyle(
    color: Color(0xff3E423F), fontWeight: FontWeight.w900, fontSize: 20);

const cCartProductPriceTextStyle = TextStyle(
    color: cTextColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1);
