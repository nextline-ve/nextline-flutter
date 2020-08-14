import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/utils/app_session.dart';

class BlocAuth implements Bloc {
  final AppSession appSession = AppSession();
  final StreamController<ModelSession> _streamController =
      StreamController<ModelSession>.broadcast();


  Stream<bool> get isLogin =>
      Stream.fromFuture(appSession.isLogin());

  @override
  void dispose() {
    _streamController.close();
  }

}
