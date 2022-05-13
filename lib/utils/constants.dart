import 'package:flutter/material.dart';
import 'package:sp_shop_app/size_config.dart';

class Constants {
  static const String HOME_SCREEN = "HOME_SCREEN";
  static const String COLLECTION_SCREEN = "COLLECTION_SCREEN";
  static const String EXPLORE_SCREEN = "EXPLORE_SCREEN";
  static const String PROFILE_SCREEN = "PROFILE_SCREEN";
  static const String PRODUCT_DETAIL_SCREEN = "PRODUCT_DETAIL_SCREEN";
  static const String CART_SCREEN = "CART_SCREEN";
  static const String WELCOME_SCREEN = "WELCOME_SCREEN";
  static const String MY_ORDERS_SCREEN = "MY_ORDERS_SCREEN";
  static const String EDIT_PROFILE_SCREEN = "EDIT_PROFILE_SCREEN";

  static const String LOGIN_SCREEN = "LOGIN_SCREEN";
  static const String SIGNUP_SCREEN = "SIGNUP_SCREEN";
  static const String SPLASH_SCREEN = "SPLASH_SCREEN";
  static const String LOGIN = "Đăng nhập";
  static const String MY_ORDERS_TITLE = "Đơn hàng của tôi";
  static const String LOGIN_GOOGLE = "Đăng nhập bằng Google";
  static const String EMAIL = "Email";
  static const String PASSWORD = "Mật khẩu";
  static const String SIGN_UP = "Đăng ký";
  static const String HAVE_NOT_AN_ACCOUNT = "Bạn chưa có tài khoản ? ";
  static const String HAVE_AN_ACCOUNT = "Bạn đã có tài khoản ? ";
  static const String CONFIRM_PASSWORD = "Xác thực mật khẩu";
  static const String FULL_NAME = "Họ và tên";
  static const String DOUBLE_T = "DoubleT Sport";
  static const String SEARCH_TEXT = "Nhập vào từ khóa";

  static const String PROFILE = "Tài khoản";
  // Dialog
  static const String WARNING_TITLE = "Cảnh báo";
  static const String NOTIFY_TITLE = "Thông báo";
  static const String ERROR_TITLE = "Lỗi";
  static const String MISS_FIELD =
      "Có thông tin chưa được nhập. Vui lòng nhập đầy đủ thông tin.";
  static const String INVALID_EMAIL = "Email không hợp lệ.";
  static const String PASS_NO_MATCH = "Xác thực mật khẩu không trùng khớp.";
  static const String REGISTER_FAILED = "Đăng ký thất bại. Vui lòng thử lại.";
  static const String REGISTER_SUCCESS = "Đăng ký thành công.";
  static const String I_KNOW = "Tôi biết rồi";
  static const String WAIT = "Đợi một chút ...";
  static const String LOGIN_FAILED = "Email hoặc mật khẩu không đúng.";
  static const String NOT_ENOUGH_LENGTH = "Mật khẩu phải chứa ít nhất 8 kí tự.";
  static const String ADD_SUCCESSFULLY = "Thêm vào giỏ hàng thành công";
  static const String OK = "OK";
  static const String SAVE = "Lưu";
  static const String INFO = "Thông tin cá nhân";
  static const String RECEIVE_ADDRESS = "Địa chỉ nhận hàng";
  static const String EDIT_PASSWORD = "Thay đổi mật khẩu";
  static const String CHECKOUT = "Chi tiết đơn hàng";
  static const String PRODUCT_LIST_CHECKOUT = "Sản phẩm";
  static const String DELIVERY_INFO = "Thông tin giao hàng";
  static const String RECEIVE_PEOPLE = "Người nhận";
  static const String PHONE_NUMBER = "Số điện thoại";
  static const String ADDRESS = "Địa chỉ";
  static const String OTP_VERIFICATION = "Xác thực OTP";
  static const String RESEND_OTP = "Tôi không nhận được mã. Hãy gửi lại!";
  static const String SUMMARY = "Tổng cộng";
  static const String PAYMENT_TYPE = "Hình thức thanh toán";
  static const String ORDER_PRICE = "Giá tiền: ";
  static const String SHIPPING_FEE = "Phí vận chuyển: ";
  static const String TOTAL = "Tổng cộng: ";
  static const String FORGET_PASSWORD = "Quên mật khẩu";
}

const kPrimaryColor = Color.fromARGB(255, 233, 71, 71);
const kPrimaryLightColor = Color.fromARGB(255, 255, 247, 247);
const whiteColor = Color.fromARGB(255, 253, 253, 253);
const blueColor = Color.fromARGB(255, 69, 164, 241);
const cMainColor = Color(0xff53B175);
const cTextColor = Color(0xff181725);
const cWhiteColor = Color(0xffffffff);
const cSubtitleTextColor = Color(0xff7C7C7C);
const kTextColor = Color(0xFF757575);
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

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
