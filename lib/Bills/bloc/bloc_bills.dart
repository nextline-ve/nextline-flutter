import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:nextline/Bills/model/model_bill.dart';
import 'package:nextline/Bills/repository_bills.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class BlocBills implements Bloc {
  final RepositoryBills repository = RepositoryBills();
  DatabaseReference _billsRef;
  FirebaseDatabase database;
  Map<String, dynamic> bills;

  final StreamController<dynamic> _streamController =
      StreamController<dynamic>.broadcast();

  Future<List<Bill>> getDataBills() async {
    return await repository.getDataBillsAPI();
  }

  BlocBills() {
    database = FirebaseDatabase();
    print("${database.databaseURL} url");
    _billsRef = database.reference().child('billsCollections');
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    bills = new Map();
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
