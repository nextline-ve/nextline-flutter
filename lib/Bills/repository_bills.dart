import 'package:dio/dio.dart';
import 'package:nextline/Bills/model/model_bill.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryBills extends AppHttp {
  Future<List<Bill>> getDataBillsAPI() async {
    Response response;
    try {
      response = await http.get("${api}admon/factura/",
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    final parsed = response.data['results'].cast<Map<String, dynamic>>();
    return parsed.map<Bill>((json) => Bill.fromJson(json)).toList();
  }
}
