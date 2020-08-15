import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class ColoredLabel extends StatelessWidget {
  final String text;
  const ColoredLabel({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.green_color
      ),
      child: Text(
        "             ${this.text}            " ,
        style: TextStyle(
          color: AppColors.white_color,
          fontFamily:  AppFonts.fontTitle
        ),
      ),
    );
  }
}
