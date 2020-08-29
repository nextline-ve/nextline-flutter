import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:nextline/Bills/model/model_bill.dart';
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

  BlocBills() {
    bills = new Map();
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
