import 'dart:async';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/utils/app_session.dart';
import 'package:nextline/utils/geolocation_background.dart';
import '../repository_auth.dart';

class BlocAuth implements Bloc {
  final AppSession appSession = AppSession();
  GeolocationBackground geolocationBackground;

  // Para hacer login
  final StreamController<Map<String, dynamic>> _streamMakeLogin =
      StreamController<Map<String, dynamic>>.broadcast();
  Sink<Map<String, dynamic>> get dataForLogin => _streamMakeLogin.sink;
  Stream<bool> get responseMakeLogin =>
      _streamMakeLogin.stream.asyncMap((dataLogin) => _makeLogin(dataLogin));
  Future<bool> _makeLogin(Map<String, dynamic> dataLogin) async {
    ModelSession data = await RepositoryAuth().setMakeLoginAPI(dataLogin);
    if (data.idUsuario is int) {
      await appSession.register(data);
      if (data.tipoUsuario == 'T') {
        GeolocationBackground(technicianId: data.idUsuario);
      }
    }
    return data.idUsuario is int;
  }

  Stream<bool> get isActiveSession =>
      Stream.fromFuture(appSession.isActiveSession());

  Future closeSession() async {
    await appSession.unregister();
  }

  Future retrievePassword(Map<String, dynamic> data) async {
    return await RepositoryAuth().retrievePassword(data);
  }

  @override
  void dispose() {
    _streamMakeLogin.close();
  }
}
