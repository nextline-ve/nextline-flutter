import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:nextline/Bills/model/model_bank.dart';
import 'package:nextline/Bills/model/model_bill.dart';
import 'package:nextline/Bills/model/model_company.dart';
import 'package:nextline/Bills/model/model_currency.dart';
import 'package:nextline/Bills/repository_bills.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class BlocBills implements Bloc {
  final RepositoryBills repository = RepositoryBills();
  Map<String, dynamic> bills;

  final StreamController<dynamic> _streamController =
      StreamController<dynamic>.broadcast();

  Future<List<Bill>> getDataBills() async {
    return await repository.getDataBillsAPI();
  }

  Future<List<BankModel>> getDataBanks() async {
    return await repository.getDataBanksAPI();
  }

  Future<List<CurrencyModel>> getDataCurrencies() async {
    return await repository.getDataCurrenciesAPI();
  }

  Future<List<CompanyModel>> getDataCompanies() async {
    return await repository.getDataCompaniesAPI();
  }

  BlocBills() {
    bills = new Map();
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
