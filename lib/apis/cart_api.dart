import 'package:dio/dio.dart';
import 'package:sp_shop_app/entities/cart_item.dart';
import 'package:sp_shop_app/utils/http.dart';

class CartApi {
  static Future<List> getCart() async {
    try {
      Response result = await http.get('/cart/getCartItems');
      var res = result.data['cartItems']
          .map((item) => CartItem.fromJson(item))
          .toList();
      return res;
    } catch (e) {
      throw (e);
    }
  }
// router.post('/cart/addToCart', requireSignin, userMiddleware, addToCart);
// router.get('/cart/getCartItems', requireSignin, userMiddleware, getCartItems);
// router.post('/cart/removeItem', requireSignin, userMiddleware, removeCartItems);
}
