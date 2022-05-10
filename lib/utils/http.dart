import 'package:dio/dio.dart' show Dio, DioError;
import 'package:shared_preferences/shared_preferences.dart';

final Http http = Http();

class Http {
  String apiURL = 'http://ec2-3-210-203-215.compute-1.amazonaws.com/api';
  var tokenVip =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MTU1NWExYWEwYWM4MjEzNDg2NTYxMWEiLCJlbWFpbCI6InN1cGVyanVuaW9yMjQyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjUxNDU5OTQzfQ.VZGbRdo0P1gLBqJY8o4npas9OGI3ZIZJ84NA3UiU61c';
  final Dio dio = Dio();
  auth() async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('token');
    if (token != null) {
      http.dio.options.headers = {'Authorization': 'Bearer ${token}'};
    } else {
      http.dio.options.headers = {'Authorization': 'Bearer ${tokenVip}'};
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
