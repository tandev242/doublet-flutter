import 'package:get/get.dart';
import 'package:sp_shop_app/entities/cart_item.dart';

class CartController extends GetxController{
  var cartItems = <CartItem>[].obs;
  int get itemCount => cartItems.length;
  double get totalPrice => cartItems.fold(0.0, (sum, item) => sum + item.product!.price);
  addToCart(CartItem item){
    cartItems.add(item);
  }
  removeFromCart(int index){
    cartItems.removeAt(index);
  }
}