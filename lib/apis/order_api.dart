import 'package:dio/dio.dart';
import 'package:sp_shop_app/entities/order.dart';
import 'package:sp_shop_app/utils/http.dart';

class OrderApi {
  static Future<List> getOrders() async {
    try {
      Response result = await http.post('/order/getOrders');
      var res =
          result.data['orders'].map((item) => Order.fromJson(item)).toList();
      return res;
    } catch (e) {
      throw (e);
    }
  }

  static Future<bool> addOrder(payload) async {
    try {
      Response res = await http.post('/order/add', data: payload);
      if (res.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      throw (e);
    }
  }

  static Future<String> addOrderByMomo(payload) async {
    try {
      Response res = await http.post('/order/paymentWithMomo', data: payload);
      if (res.statusCode == 200) {
        return res.data['url'];
      }
      return "";
    } catch (e) {
      throw (e);
    }
  }
}
