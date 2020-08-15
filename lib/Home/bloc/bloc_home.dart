import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/utils/app_session.dart';

import '../repository_home.dart';

class BlocHome implements Bloc {
  final StreamController<int> _streamController = StreamController<int>.broadcast();

  Sink<int> get id_suario => _streamController.sink;
  Stream<Map<String, dynamic>> get responseDataHome => _streamController.stream
      .asyncMap((id_usuario) => getDataHome(id_usuario));

  Future<Map<String, dynamic>> getDataHome(int id_usuario) async {
    if (AppSession.data.esCliente) {
      return await RepositoryHome().getDataHomeAPI('admon/contratos-status');
    } else {
      return await RepositoryHome().getDataHomeAPI('solicitud/contratos-status');
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
