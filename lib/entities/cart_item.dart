import 'package:sp_shop_app/entities/product.dart';
import 'package:sp_shop_app/entities/size.dart';

class CartItem {
  final Product? product;
  final Size? size;
  final int quantity;

  CartItem({required this.product, required this.size, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
        product:
            json['product'] == null ? null : Product.fromJson(json['product']),
        size: json['size'] == null ? null : Size.fromJson(json['size']),
        quantity: json['quantity']);
  }
}
