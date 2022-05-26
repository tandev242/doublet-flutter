import 'package:dio/dio.dart';
import 'package:sp_shop_app/entities/product.dart';
import '../utils/http.dart';

class UserApi{

  static Future<dynamic> update(data) async {
    try {
      Response result = await http.post('/user/updateUserInfo',data: data);
      var res = result.data;
      print(res);
      return res;
    } catch (e) {
      return null;
    }
  }

}