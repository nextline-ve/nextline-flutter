import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class HLabelText extends StatelessWidget {
  final String title;
  final Color color;

  const HLabelText({Key key, @required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.ligth_blue_color,
        fontFamily: AppFonts.subTitle,
        fontSize: 14,
      ),
    );
  }
}
