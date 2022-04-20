import 'package:sp_shop_app/entities/product.dart';
import 'package:sp_shop_app/entities/size.dart';

class OrderItem {
  final Product? product;
  final Size? size;
  final int? payablePrice;
  final int purchaseQty;
  OrderItem(
      {required this.product,
      required this.size,
      required this.payablePrice,
      required this.purchaseQty});
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
        product: json['productId'] == null
            ? null
            : Product.fromJson(json['productId']),
        size: json['sizeId'] == null ? null : Size.fromJson(json['sizeId']),
        payablePrice: json['payablePrice'],
        purchaseQty: json['purchaseQty']);
  }
}

class OrderStatus {
  final String? type;
  final bool? isCompleted;
  OrderStatus({required this.type, required this.isCompleted});
  factory OrderStatus.fromJson(Map<String, dynamic> json) {
    return OrderStatus(type: json['type'], isCompleted: json['isCompleted']);
  }
}

class Order {
  final String id;
  final List? orderStatus;
  final String? paymentType;
  final String? createdAt;
  final int? totalAmount;
  final List? items;

  Order(
      {required this.id,
      required this.orderStatus,
      required this.paymentType,
      required this.createdAt,
      required this.totalAmount,
      this.items});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['_id'],
        orderStatus: json['orderStatus'] == null
            ? []
            : List<dynamic>.from(json['orderStatus'].map((i) {
                return OrderStatus.fromJson(i);
              })),
        paymentType: json['paymentType'],
        createdAt: json['createdAt'],
        totalAmount: json['totalAmount'],
        items: json['items'] == null
            ? []
            : List<dynamic>.from(json['items'].map((i) {
                return OrderItem.fromJson(i);
              })));
  }
}
