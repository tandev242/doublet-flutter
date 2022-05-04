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
  static Future<bool> addToCart(cartItems) async {
    try {
      Response res = await http.post('/cart/addToCart', data: cartItems);
      if(res.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      throw (e);
    }
  }
  static Future<bool> removeCartItem(cartItem) async {
    try {
      Response res = await http.post('/cart/removeItem', data: cartItem);
      if(res.statusCode == 202) {
        return true;
      }
      return false;
    } catch (e) {
      throw (e);
    }
  }
}
