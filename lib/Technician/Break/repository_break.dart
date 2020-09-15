import 'package:dio/dio.dart';
import 'package:nextline/Technician/Break/model_break.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryBreaks extends AppHttp {
  Future<Break> addBreakAPI(Break dataBreak) async {
    Response response;
    FormData formData = dataBreak.toFormData();
    try {
      response = await http.post("${api}support/break/informar/",
          data: formData, options: Options(headers: header));
    } on DioError catch (e) {
      print(e.response);
    }
    return Break.fromJson(response.data);
  }
}
