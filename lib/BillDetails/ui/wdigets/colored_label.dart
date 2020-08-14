import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';

class ColoredLabel extends StatelessWidget {
  final String text;
  const ColoredLabel({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: AppColors.green_color
      ),
      child: Text(
        "    ${this.text}   " ,
        style: TextStyle(
          color: AppColors.white_color,
        ),
      ),
    );
  }
}
