import 'package:dio/dio.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryHome extends AppHttp {
  
  Future<Map<String, dynamic>> getDataHomeAPI(String urlEndpoint) async {
    
    Response response;
    try {
      response =
          await http.get(api + urlEndpoint, options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    return response.data['results'][0];
  }
}
