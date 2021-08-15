import 'package:dio/dio.dart';
import 'package:ridethebee/app/constant/my_constant.dart';

class MyConnection {
  Dio getDioConnection(String token) {
    var headers1 = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    var headers2 = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer $token',
    };

    Dio dio = new Dio();
    dio.options.headers = token != null && token.isNotEmpty ? headers2 : headers1;
    dio.options.baseUrl = MyConstant.BASE_URL;
    return dio;
  }
}