import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import '../../../widgets/line.dart';

class HStatusRecipe extends StatefulWidget {
  HStatusRecipe({Key key}) : super(key: key);

  @override
  _HStatusRecipeState createState() => _HStatusRecipeState();
}

class _HStatusRecipeState extends State<HStatusRecipe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
            color: AppColors.blue_dark.withOpacity(0.33),
          ),
        ],
      ),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _label("Fecha de pago".toUpperCase()),
              Expanded(
                  child: Center(child: _lastRecipeDate(new DateTime(2020))))
            ],
          ),
          VerticalLine(
            heigth: 80,
            width: 1,
            color: AppColors.blue_dark,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _label("total a pagar".toUpperCase()),
              _currencyText("\$20", 24, 1.2),
              _currencyText("Bs 2.200.000", 14, 0.7),
            ],
          )
        ],
      ),
    );
  }
}

Widget _label(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Text(
      text,
      style: TextStyle(fontFamily: AppFonts.poppins_regular, fontSize: 10),
    ),
  );
}

Widget _lastRecipeDate(DateTime date) {
  return Text("20/09/2020",
      style: TextStyle(
          color: AppColors.blue_dark,
          fontFamily: AppFonts.poppins_regular,
          fontSize: 18));
}

Widget _currencyText(String text, double fontSize, double spacing) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: AppFonts.poppins_bold,
        color: AppColors.blue_dark,
        fontSize: fontSize,
        letterSpacing: spacing),
  );
}
