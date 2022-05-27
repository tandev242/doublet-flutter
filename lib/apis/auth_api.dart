import 'package:dio/dio.dart';
import '../utils/http.dart';

class AuthApi {
  static Future<dynamic> login(data) async {
    try {
      Response result = await http.post('/auth/signin', data: data);
      var res = result.data;
      print(res);
      return res;
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> register(data) async {
    try {
      Response result = await http.post('/auth/signup', data: data);
      var res = result.data;
      return res;
    } catch (e) {
      throw (e);
    }
  }

  static Future<dynamic> isUserLoggedIn(data) async {
    try {
      Response result = await http.post('/auth/isUserLoggedIn', data: data);
      var res = result.data;
      return res;
    } catch (e) {
      throw (e);
    }
  }

  static Future<dynamic> sendOtpByEmail(email) async {
    try {
      Response response = await http.post('/auth/sendOtpToEmail', data: email);
      var res = response.data;
      return res;
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> forget(data) async {
    try {
      print(data);
      Response response =
          await http.post("/auth/updateForgetPassword", data: data);
      var res = response.data;
      return res;
    } catch (e) {
      return null;
    }
  }
}
