import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_session.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

abstract class AppHttp {
  Dio http = Dio();
  String api = 'https://nextline.jaspesoft.com/api/v1/';
  Map<String, dynamic> header = {
    HttpHeaders.authorizationHeader:
        "Token ${(AppSession.data != null) ? AppSession.data.token : ''}"
  };

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
