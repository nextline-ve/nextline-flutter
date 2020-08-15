import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class HCirclePlan extends StatelessWidget {
  final String planName;

  const HCirclePlan({Key key, @required this.planName}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          width: 240 * (MediaQuery.of(context).size.height / 812),
          height: 240 * (MediaQuery.of(context).size.height / 812),
          padding: EdgeInsets.all(15),
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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.ligth_blue_color,
                    AppColors.blue,
                    AppColors.blue_dark,
                  ])),
          child: Container(
            // margin: EdgeInsets.all(15),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.white, style: BorderStyle.solid, width: 6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/logo_without_text.svg",
                    height: 35, color: AppColors.ligth_blue_color),
                _planNameText(planName),
                _planLabelText("plan"),
              ],
            ),
          )),
    );
  }
}

Widget _planNameText(String plan) {
  return Text(plan,
      style: TextStyle(
          color: Colors.white,
          fontFamily: AppFonts.poppins_semiBold,
          fontSize: 32));
}

Widget _planLabelText(String text) {
  return Text(text.toUpperCase(),
      style: TextStyle(
          color: Colors.white, fontFamily: AppFonts.fontTitle, fontSize: 12));
}
