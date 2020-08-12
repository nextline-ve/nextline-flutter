import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class AddTicketButton extends StatelessWidget {
  const AddTicketButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330,
        height: 160,
        margin: EdgeInsets.only(top: 45),
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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            width: 80,
            height: 80,
            decoration: new BoxDecoration(
                // color: Colors.orange,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Color(0x005FAB33),
                      offset: Offset(0, 3))
                ],
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.ligth_blue_color,
                      AppColors.blue,
                      AppColors.blue_dark,
                    ])),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/plus.svg",
                      height: 38, color: AppColors.white_color),
                ],
              ),
            ),
          ),
          Column(
            children: [
              _buttonLabelText("Crear nuevo ticket"),
              _buttonLowLabelText(
                  "Crea un nuevo ticket para reportar una avería"),
            ],
          )
        ]));
  }
}

Widget _buttonLabelText(String status) {
  return Text(status.toUpperCase(),
      style: TextStyle(
          fontFamily: AppFonts.poppins_regular,
          fontSize: 14,
          color: AppColors.blue_dark));
}

Widget _buttonLowLabelText(String status) {
  return Text(status.toUpperCase(),
      style: TextStyle(
          fontFamily: AppFonts.poppins_regular,
          fontSize: 10,
          color: AppColors.gray_text_color));
}
