import 'package:dio/dio.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryHome extends AppHttp {
  
  Future<Map<String, dynamic>> getDataHomeAPI(String urlEndpoint) async {
    
    Response response;
    try {
      response =
          await http.get(api + urlEndpoint, options: Options(headers: header));
          print("hola");
    } on DioError catch (e) {
      print("err");
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    print(response.data['results']);
    return response.data['results'][0];
  }
}
