import 'package:flutter/material.dart';
import 'package:nextline/utils/app_fonts.dart';

class JLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Cargando los datos.",
              style: TextStyle(
                fontFamily: AppFonts.fontTitle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
