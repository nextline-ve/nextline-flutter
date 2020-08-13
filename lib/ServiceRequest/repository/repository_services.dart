
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nextline/ServiceRequest/model/model_services.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryServices extends AppHttp{

  List<ModelServices> parseService(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ModelServices>((json) => ModelServices.fromJson(json)).toList();
  }

  Future <List<ModelServices>> getListServices() async {
    Response resp = await http.get(api + 'config/tipo-servicios/');
    return parseService(jsonEncode(resp.data['results']));

  }
}