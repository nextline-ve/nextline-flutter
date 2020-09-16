import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Technician/Break/model_break.dart';
import 'package:nextline/Technician/Break/model_reason.dart';
import 'package:nextline/Technician/Break/repository_break.dart';

class BlocBreaks implements Bloc {
  final RepositoryBreaks reposity = RepositoryBreaks();

  Future<Break> addBreak(Break dataBreak) async {
    return await reposity.addBreakAPI(dataBreak);
  }

  Future<List<Reason>> getReasons() async {
    return await reposity.getReasonsAPI();
  }

  final StreamController<dynamic> _streamController =
      StreamController<dynamic>.broadcast();

  @override
  void dispose() {
    _streamController.close();
  }
}
