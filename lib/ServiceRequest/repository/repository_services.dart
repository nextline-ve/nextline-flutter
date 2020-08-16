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
        .map<ModelPlans>((json) => ModelServices.fromJson(json))
        .toList();
  }

  Future<List<ModelServices>> getListServicesAPI() async {
    Response resp = await http.get(api + 'config/tipo-servicios/');
    return parseService(resp.data['results']);
  }

  Future<List<ModelPlans>> getListPlansAPI() async {
    Response resp = await http.get(api + 'config/planes/');
    return parsePlan(resp.data['results']);
  }
}
