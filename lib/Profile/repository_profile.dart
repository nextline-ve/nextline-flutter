import 'package:dio/dio.dart';
import 'package:nextline/Profile/model/model_profile.dart';
import 'package:nextline/Technician/Profile/model_profile.dart';
import 'package:nextline/utils/app_http.dart';

class RepositoryProfile extends AppHttp {
  Future<ProfileModel> getDataProfileAPI() async {
    Response response;
    try {
      response = await http.get(api + 'admon/perfil',
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    return ProfileModel.fromJson(response.data);
  }

  Future<ProfileModel> patchDataProfileAPI(Map<String, dynamic> data) async {
    Response response;
    try {
      response = await http.patch(api + 'admon/perfil',
          data: data, options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    return ProfileModel.fromJson(response.data);
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
    return response.data;
  }

  Future<TechProfile> getTechProfileAPI() async {
    Response response;
    try {
      response = await http.get(api + 'support/perfil/',
          options: Options(headers: header));
    } on DioError catch (e) {
      Map error = e.response.data;
      error.forEach((key, value) => throw (value));
    }
    return TechProfile.fromJson(response.data);
  }
}
