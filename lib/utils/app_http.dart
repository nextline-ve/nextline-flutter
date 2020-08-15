import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

abstract class AppHttp {
  Dio http = Dio();
  String api = 'https://nextline.jaspesoft.com/api/v1/';
  static requestIndicator(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.ligth_blue_color,
        content: Container(height: 80,
        child: Column(      
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Procesando su solicitud",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppFonts.poppins_regular
                ),
              ),
              Padding(padding: EdgeInsets.all(10), child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white) ),)
            ],
          ),
          ),
      )
    );
  }
  /*static Scaffold requestIndicator = Scaffold.of().showSnackBar(
      SnackBar(
        backgroundColor: AppColors.light_gray_color,
        content: Center(
            child: Column(              
              children: [
                Text("Procesando su solicitud"),
                CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue_dark) )
              ],
            ),
        ),
      )
    ) as Scaffold;*/
}