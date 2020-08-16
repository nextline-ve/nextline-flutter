import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nextline/ServiceRequest/model/model_plans.dart';
import 'package:nextline/ServiceRequest/model/model_services.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryServices extends AppHttp {
  List<ModelServices> parseService(jsonResponse) {
    final parsed = jsonResponse.cast<Map<String, dynamic>>();
    return parsed
        .map<ModelServices>((json) => ModelServices.fromJson(json))
        .toList();
  }

  List<ModelPlans> parsePlan(jsonResponse) {
    final parsed = jsonResponse.cast<Map<String, dynamic>>();
    return parsed
        .map<ModelPlans>((json) => ModelPlans.fromJson(json))
        .toList();
  }

  Future<List<ModelServices>> getListServicesAPI() async {
    Response resp = await http.get(api + 'config/tipo-servicios/');
    return parseService(resp.data['results']);
  }

  Future<List<ModelPlans>> getListPlansAPI(int serviceId) async {
    Response resp = await http.get(api + 'config/planes/', queryParameters: {'tipo_servicio__id': serviceId});
    return parsePlan(resp.data['results']);
  }
  Future<String> setSendRequestServiceAPI(Map<String, dynamic> dataRequestService) async {
    Response resp;
    try {
      FormData formData = new FormData.fromMap(dataRequestService);
      resp = await http.post(api + 'admon/service-request', data: formData);
    } on DioError catch (e) {
      Map error = jsonDecode(jsonEncode(e.response.data));
      error.forEach((key, value) {
        throw (value);
      });
    }
    return resp.data['message'];
  }
}
