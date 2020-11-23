import 'package:dio/dio.dart';
import 'package:nextline/Tickets/model/model_issue_type.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryTickets extends AppHttp {
  Future<List<Ticket>> getDataTicketsAPI() async {
    Response response;
    try {
      response = await http.get('${api}support/tickets/',
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    final parsed = response.data['results'].cast<Map<String, dynamic>>();
    return parsed.map<Ticket>((json) => Ticket.fromJson(json)).toList();
  }

  Future<Ticket> addTicket(Ticket dataTicket) async {
    Response response;
    try {
      FormData formData = dataTicket.toFormData();
      response = await http.post('${api}support/tickets/',
          data: formData, options: Options(headers: header));
    } on DioError catch (e) {
      print(e.response);
    }
    return Ticket.fromJson(response.data);
  }

  Future<List<IssueType>> getIssueTypeAPI() async {
    Response response;
    try {
      response = await http.get('${api}support/tickets/categoria-fallas/',
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    final parsed = response.data['results'].cast<Map<String, dynamic>>();
    return parsed.map<IssueType>((json) => IssueType.fromJson(json)).toList();
  }

  Future<List<Ticket>> getAssignedTicketsAPI() async {
    Response response;
    try {
      response = await http.get('${api}support/tickets-asignados/',
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    final parsed = response.data['results'].cast<Map<String, dynamic>>();
    return parsed.map<Ticket>((json) => Ticket.fromJson(json)).toList();
  }

  Future<Ticket> getDetailsAssignedTicketsAPI(id) async {
    Response response;
    try {
      response = await http.get('${api}support/tickets-asignados/$id',
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    return Ticket.fromJson(response.data);
  }

}
