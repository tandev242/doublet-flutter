import 'package:dio/dio.dart';
import 'package:sp_shop_app/entities/delivery.dart';

import '../utils/http.dart';

class DeliveryApi {
  static Future<dynamic> getListDelivery() async {
    try {
      Response result = await http.get('/deliveryInfo/get');
      var res = result.data;
      var res1 = res["deliveryInfo"];
      var res2 = res1['address'];
      print('List delivery: $res2 ');
      print(res);
      return res;
    } catch (e) {
      return null;
    }
  }
}
