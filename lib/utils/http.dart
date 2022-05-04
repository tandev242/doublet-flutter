import 'package:dio/dio.dart' show Dio, DioError;

final Http http = Http();

class Http {
  // String apiURL = 'http://ec2-3-210-203-215.compute-1.amazonaws.com/api';
  String apiURL = 'https://api-sportswear.herokuapp.com/api';

  final Dio dio = Dio();
  auth(token) {
    if (token != null) {
      http.dio.options.headers = {'Authorization': 'Bearer $token'};
    }
    http.dio.options.headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MTU1NWExYWEwYWM4MjEzNDg2NTYxMWEiLCJlbWFpbCI6InN1cGVyanVuaW9yMjQyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjUwNjc2NzkxLCJleHAiOjE2NTA3NjMxOTF9.wlXM_oYEesKwhJJ_k8pnq8tfbxfuZeyDC9tpRnxwGFE'
    };
  }

  get(String url, {data}) async {
    auth(null);
    try {
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
    auth(null);
    try {
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
