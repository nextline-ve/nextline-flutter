import 'dart:async';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Profile/model/model_profile.dart';
import 'package:nextline/utils/app_session.dart';
import './repository_profile.dart';

class BlocProfile implements Bloc {
  final RepositoryProfile repository = RepositoryProfile();

  final StreamController<int> _streamController =
      StreamController<int>.broadcast();

  ProfileModel profileData = ProfileModel();

  Future<ProfileModel> getDataProfile() async {
    if (AppSession.data.idUsuario == 0) {
      profileData = await repository.getDataProfileFutureClientAPI();

    } else {
      profileData = await repository.getDataProfileAPI();
    }

    return profileData;
  }

  Future<ProfileModel> patchDataProfile(Map<String, dynamic> data) async {
    if (AppSession.data.idUsuario == 0) {
      profileData = await repository.patchDataProfileFutureClientAPI(data);
    } else {
      profileData = await repository.patchDataProfileAPI(data);
    }
    AppSession.data.avatar = profileData.avatar;

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
