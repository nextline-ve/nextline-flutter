import 'dart:async';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Profile/model/model_profile.dart';

import './repository_profile.dart';

class BlocProfile implements Bloc {
  final RepositoryProfile repository = RepositoryProfile();

  final StreamController<int> _streamController =
      StreamController<int>.broadcast();

  ProfileModel profileData = ProfileModel();

  Future<ProfileModel> getDataProfile() async {
    profileData = await repository.getDataProfileAPI('admon/contratos-status');
    return profileData;
  }

  Future<ProfileModel> putDataProfile() async {
    profileData = await repository.putDataProfileAPI(profileData);
    return profileData;
  }

  Future<Map<String, String>> changePassword(
      String oldPassword, String newPassword) async {
    return await repository.changePasswordAPI(oldPassword, newPassword);
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
