import 'package:dio/dio.dart';

import '../utils/http.dart';

class AuthApi {
  static Future<dynamic> login(data) async {
    try {
      Response result = await http.post('/signin',
          data: {"email": "superjunior242@gmail.com", "password": "matkhau1"});
      var res = result.data;
      print(res["token"]);
      return res;
    } catch (e) {
      throw (e);
    }
  }

  static Future<dynamic> register(data) async {
    try {
      Response result = await http.post('/register', data: data);
      var res = result.data;
      return res;
    } catch (e) {
      throw (e);
    }
  }
}
