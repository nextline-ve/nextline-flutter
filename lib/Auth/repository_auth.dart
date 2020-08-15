import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nextline/utils/app_http.dart';
import 'package:nextline/utils/app_session.dart';

class RepositoryAuth extends AppHttp {
  Future<ModelSession> setMakeLoginAPI(Map<String, dynamic> dataLogin) async {
    try {
      FormData formData = new FormData.fromMap(dataLogin);
      Response resp = await http.post(api + 'config/auth/', data: formData);
      return ModelSession.fromJson(resp.data);
    } on DioError catch(e) {
      Map error = jsonDecode(jsonEncode(e.response.data));
      error.forEach((key, value) {
        throw(value);
      });
    }
  }
}
