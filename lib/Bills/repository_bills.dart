import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nextline/Bills/model/model_bank.dart';
import 'package:nextline/Bills/model/model_bill.dart';
import 'package:nextline/Bills/model/model_company.dart';
import 'package:nextline/Bills/model/model_currency.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryBills extends AppHttp {
  Future<List<Bill>> getDataBillsAPI() async {
    Response response;
    try {
      response = await http.get("${await AppHttp.getUurlAapi()}admon/factura/",
          options: Options(headers: header));
    } on DioError catch (e) {
      print('errr');
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    try {
      final parsed = response.data['results'].cast<Map<String, dynamic>>();
      return parsed.map<Bill>((json) => Bill.fromJson(json)).toList();
    } on NoSuchMethodError catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<CurrencyModel>> getDataCurrenciesAPI() async {
    Response response;
    try {
      response = await http.get("${await AppHttp.getUurlAapi()}config/monedas/",
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    final parsed = response.data['results'].cast<Map<String, dynamic>>();
    return parsed
        .map<CurrencyModel>((json) => CurrencyModel.fromJson(json))
        .toList();
  }

  Future<List<CompanyModel>> getDataCompaniesAPI() async {
    Response response;
    try {
      response = await http.get("${await AppHttp.getUurlAapi()}config/empresa/",
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    final parsed = response.data['results'].cast<Map<String, dynamic>>();
    return parsed
        .map<CompanyModel>((json) => CompanyModel.fromJson(json))
        .toList();
  }

  Future<List<BankModel>> getDataBanksAPI() async {
    Response response;
    try {
      response = await http.get("${await AppHttp.getUurlAapi()}config/bancos/",
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    final parsed = response.data['results'].cast<Map<String, dynamic>>();
    return parsed.map<BankModel>((json) => BankModel.fromJson(json)).toList();
  }

  Future<bool> savePaymentStatement(
      int invoiceId, Map<String, dynamic> data) async {
    try {
      // FormData formData = new FormData.fromMap(data);
      await http.post(
          await AppHttp.getUurlAapi() +
              'admon/factura/${invoiceId.toString()}/declarar-pago/',
          data: data,
          options: Options(headers: header)
      );
      return true;
    } on DioError catch (e) {
      print(e.response.data);
      Map error = jsonDecode(jsonEncode(e.response.data));
      error.forEach((key, value) {
        throw (value);
      });
      return false;
    }
  }
}
