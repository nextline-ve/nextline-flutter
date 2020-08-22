import 'package:dio/dio.dart';
import 'package:nextline/Tickets/model/model_issue_type.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryTickets extends AppHttp {
  Future<List<Ticket>> getDataTicketsAPI() async {
    Response response;
    try {
      response = await http.get("${api}support/tickets/",
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    final parsed = response.data['results'].cast<Map<String, dynamic>>();
    return parsed.map<Ticket>((json) => Ticket.fromJson(json)).toList();
  }

  Future addTicket(FormData formData) async {
    try {
      await http.post(this.api + 'device/',
          data: formData, options: Options(headers: header));
    } on DioError catch (e) {
      // print(e.response);
    }
  }

  Future<List<IssueType>> getIssueTypeAPI() async {
    Response response;
    try {
      response = await http.get("${api}support/tickets/categoria-fallas/",
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    final parsed = response.data['results'].cast<Map<String, dynamic>>();
    return parsed.map<IssueType>((json) => IssueType.fromJson(json)).toList();
  }
}
