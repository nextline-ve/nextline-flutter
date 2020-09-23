import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nextline/utils/app_http.dart';
import 'package:nextline/utils/app_session.dart';

class RepositoryAuth extends AppHttp {
  Future<ModelSession> setMakeLoginAPI(Map<String, dynamic> dataLogin) async {
    Response resp;
    try {
      FormData formData = new FormData.fromMap(dataLogin);
      resp = await http.post(api + 'config/auth/', data: formData);
    } on DioError catch (e) {
      Map error = jsonDecode(jsonEncode(e.response.data));
      error.forEach((key, value) {
        throw (value);
      });
    }
    return ModelSession.fromJson(resp.data);
  }

  Future retrievePassword(Map<String, dynamic> data) async {
    Response resp;
    try {
      FormData formData = new FormData.fromMap(data);
      resp = await http.post(api + 'config/restaurar-clave/', data: formData);
    } on DioError catch (e) {
      Map error = jsonDecode(jsonEncode(e.response.data));
      error.forEach((key, value) {
        throw (value);
      });
    }
    return resp.data;
  }
}
