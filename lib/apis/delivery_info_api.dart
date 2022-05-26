import 'package:dio/dio.dart';
import 'package:sp_shop_app/entities/address.dart';

import '../utils/http.dart';

class DeliveryInfoApi {
  static Future<dynamic> getDeliveryInfo() async {
    try {
      Response result = await http.get('/deliveryInfo/get');
      var res = result.data["deliveryInfo"]["address"]
          .map((address) => Address.fromJson(address))
          .toList();
      return res;
    } catch (e) {
      throw (e);
    }
  }

  static Future<dynamic> addDeliveryInfo(info) async {
    try {
      Response response = await http.post('/deliveryInfo/add', data: info);
      var res = response.data;
      return res;
    } catch (e) {
      throw (e);
    }
  }

  static Future<dynamic> deleteDeliveryInfo(data) async {
    try {
      Response response = await http.post('/deliveryInfo/delete', data: data);
      var res = response.data;
      return res;
    } catch (e) {
      return null;
    }
  }
}
