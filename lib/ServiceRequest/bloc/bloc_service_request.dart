import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/ServiceRequest/model/model_plans.dart';
import 'package:nextline/ServiceRequest/model/model_services.dart';
import 'package:nextline/ServiceRequest/repository/repository_services.dart';

class BlocServiceRequest implements Bloc {
  RepositoryServices repositoy = RepositoryServices();

  final StreamController<ModelServices> _streamController =
      StreamController<ModelServices>.broadcast();

  Stream<List<ModelServices>> get listServices =>
      Stream.fromFuture(_getListServices());

  Stream<List<ModelPlans>> get listPlans =>
      Stream.fromFuture(_getListPlans());

  @override
  void dispose() {
    _streamController.close();
  }

  Future<List<ModelServices>> _getListServices() async {
    return await repositoy.getListServicesAPI();
  }

  Future<List<ModelPlans>> _getListPlans() async {
    return await repositoy.getListPlansAPI();
  }
}
