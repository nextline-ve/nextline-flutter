import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/ServiceRequest/model/model_services.dart';
import 'package:nextline/ServiceRequest/repository/repository_services.dart';

class BlocServiceRequest implements Bloc {
  final StreamController<ModelServices> _streamController =
      StreamController<ModelServices>.broadcast();

  Stream<List<ModelServices>> get listServices =>
      Stream.fromFuture(getListServices());

  @override
  void dispose() {
    _streamController.close();
  }

  Future<List<ModelServices>> getListServices() async {
    return await RepositoryServices().getListServices();
  }
}
