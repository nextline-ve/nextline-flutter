import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/ServiceRequest/model/model_plans.dart';
import 'package:nextline/ServiceRequest/model/model_services.dart';
import 'package:nextline/ServiceRequest/repository/repository_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlocServiceRequest implements Bloc {
  RepositoryServices repositoy = RepositoryServices();

  final StreamController<Map<String, dynamic>> _streamControllerService =
      StreamController<Map<String, dynamic>>.broadcast();
  Sink<Map<String, dynamic>> get dataServiceRequest => _streamControllerService.sink;
  Stream<String> get responseServiceRequest =>
      _streamControllerService.stream.asyncMap((dataServiceRequest) => _sendServiceRequest(dataServiceRequest));
  Future<String> _sendServiceRequest(dataServiceRequest) async {

  }

  Stream<List<ModelServices>> get listServices =>
      Stream.fromFuture(_getListServices());

  Stream<List<ModelPlans>> get listPlans => Stream.fromFuture(_getListPlans());

  @override
  void dispose() {
    _streamControllerService.close();
  }

  Future<List<ModelServices>> _getListServices() async {
    return await repositoy.getListServicesAPI();
  }

  Future<List<ModelPlans>> _getListPlans() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    return await repositoy.getListPlansAPI(prefs.getInt("service"));
  }
}
