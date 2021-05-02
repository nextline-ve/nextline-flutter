import 'package:dio/dio.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryHome extends AppHttp {
  
  Future<Map<String, dynamic>> getDataHomeAPI(String urlEndpoint) async {
    
    Response response;
    try {
      response =
          await http.get(await this.getUurlAapi() + urlEndpoint, options: Options(headers: header));
      if (urlEndpoint == 'admon/solicitud-status')
        return response.data;
      else
        return response.data['results'][0];
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }

  }

  Future sendTokenFCMAPI(FormData formData) async {
    try {
      await http.post( await this.getUurlAapi() + 'device',
          data: formData, options: Options(headers: header));

    } on DioError catch (e) {
      print(e.response);
    }
  }
}
