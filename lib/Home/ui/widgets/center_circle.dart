import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';

class HCirclePlan extends StatelessWidget {
  const HCirclePlan({Key key}) : super(key: key);

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
                    // Colors.lightBlue,
                    // Colors.blue,
                  ])),
          child: Container(
              // margin: EdgeInsets.all(15),
              decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: Colors.white, style: BorderStyle.solid, width: 6),
          ))),
    );
  }
}
