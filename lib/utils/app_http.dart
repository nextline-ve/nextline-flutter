import 'package:dio/dio.dart';

abstract class AppHttp {
  Dio http = Dio();
  String api = 'https://nextline.jaspesoft.com/api/v1/';
}