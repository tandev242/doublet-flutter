import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/http.dart';

class RecommendApi {
  static Future<void> addBehavior(data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = await prefs.getString('token');
      print("hahaha");
      if (token != null) {
        Response res = await http.post('/recom/addBehavior', data: data);
        if (res.statusCode == 201) {
          print("Đã tracking thành công !");
        }
      }
    } catch (e) {
      return null;
    }
  }
}
