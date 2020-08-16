import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class ColoredLabel extends StatelessWidget {
  final String text;
  final Color textColor;
  const ColoredLabel({Key key, @required this.text, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.green_color),
      child: Text(
        "${this.text}",
        style: TextStyle(
            fontSize: 12,
            color: (this.textColor == null)
                ? AppColors.white_color
                : this.textColor,
            fontFamily: AppFonts.fontTitle),
      ),
    );
  }
}
