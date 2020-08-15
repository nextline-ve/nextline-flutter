import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryHome extends AppHttp {

  Future<Map<String, dynamic>> getDataHomeAPI(String url_endpoint) async {
    try {
      Response response = await http.get(api + url_endpoint, options: Options(headers: header));
      return response.data;
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw(value));
    }
  }
}