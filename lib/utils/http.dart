import 'package:dio/dio.dart' show Dio, DioError;
import 'package:shared_preferences/shared_preferences.dart';

final Http http = Http();

class Http {
  String apiURL = 'https://doublet-sport.herokuapp.com/api';
  // String apiURL = 'http://localhost:5000/api';

  var tokenVip =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MTU1NWExYWEwYWM4MjEzNDg2NTYxMWEiLCJlbWFpbCI6InN1cGVyanVuaW9yMjQyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjQ5NjUzMDEyLCJleHAiOjE2NDk3Mzk0MTJ9.upGR5Q7FOUBDts8fhuTgZyG5J2Tp3pNvLqJwNkUutEw';
  final Dio dio = Dio();
  auth() async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('token');
    if (token != null) {
      http.dio.options.headers = {'Authorization': 'Bearer ${token}'};
      return true;
    } else {
      http.dio.options.headers = {'Authorization': 'Bearer ${tokenVip}'};
      return false;
    }
  }

  get(String url, {data}) async {
    try {
      await auth();
      return await dio.get('$apiURL/$url');
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  post(String url, {data}) async {
    try {
      await auth();
      return await dio.post("$apiURL/$url", data: data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  put(String url, {data}) async {
    try {
      return await dio.put("$apiURL/$url", data: data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  patch(String url, {data}) async {
    try {
      return await dio.patch("$apiURL/$url", data: data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  delete(String url) async {
    try {
      return await dio.delete("$apiURL/$url");
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }
}
