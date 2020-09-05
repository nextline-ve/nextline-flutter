import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class InputContainer extends StatelessWidget {
  final Widget labelWidget;
  final String label;
  final Widget input;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  const InputContainer({
    Key key,
    this.label,
    @required this.input,
    this.labelWidget,
    this.paddingLeft = 24,
    this.paddingRight = 24,
    this.paddingBottom = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: paddingLeft, right: paddingRight, bottom: paddingBottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: labelWidget != null ? labelWidget : _inputLabel(label),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: AppColors.blue_dark.withOpacity(0.15),
                        offset: Offset(0, 5),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: input)
          ],
        ));
  }
}

Widget _inputLabel(String text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
        fontFamily: AppFonts.subTitle,
        fontSize: 11,
        color: AppColors.blue_dark),
  );
}
