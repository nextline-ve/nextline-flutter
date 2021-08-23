import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_session.dart';
import 'app_colors.dart';
import 'app_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

abstract class AppHttp {
  Dio http = Dio();
  String api;
  Map<String, dynamic> header = {
    HttpHeaders.authorizationHeader:
        "Token ${(AppSession.data != null) ? AppSession.data.token : ''}"
  };

  static Future<String> getUurlAapi({String apiVersion = 'v1'}) async {
    await DotEnv.load();
    return DotEnv.env['API_SERVER'] + apiVersion + '/';
  }

  static requestIndicator(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.ligth_blue_color,
      content: Container(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Procesando su solicitud",
              style: TextStyle(
                  color: Colors.white, fontFamily: AppFonts.poppins_regular),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
            )
          ],
        ),
      ),
    ));
  }
}
