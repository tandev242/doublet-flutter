import 'package:dio/dio.dart';
import 'package:sp_shop_app/entities/delivery.dart';

import '../utils/http.dart';

class DeliveryApi {
  static Future<dynamic> getListDelivery() async {
    final List<Delivery> deliveryList = [];
    try {
      Response result = await http.get('/deliveryInfo/get');
      var res = result.data;
      print(res);
      return res;
    } catch (e) {
      return null;
    }
  }
}
