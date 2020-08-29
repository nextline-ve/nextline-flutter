import 'package:dio/dio.dart';
import 'package:nextline/Profile/model/model_profile.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryProfile extends AppHttp {
  Future<ProfileModel> getDataProfileAPI(String urlEndpoint) async {
    Response response;
    try {
      response = await http.get(api + 'admon/perfil',
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    return ProfileModel.fromJson(response.data.cast<Map<String, dynamic>>());
  }

  Future<ProfileModel> putDataProfileAPI(ProfileModel profileData) async {
    Response response;
    try {
      response = await http.put(api + 'admon/perfil',
          data: profileData, options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    return ProfileModel.fromJson(response.data.cast<Map<String, dynamic>>());
  }

  Future<Map<String, String>> changePasswordAPI(
      String oldPassword, String newPassword) async {
    Response response;
    try {
      response = await http.post(api + 'admon/cambiar-clave/',
          data: {"old_clave": oldPassword, "clave": newPassword},
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    return response.data.cast<Map<String, String>>();
  }
}
