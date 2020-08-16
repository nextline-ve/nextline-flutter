import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/ui/widgets/scrollPlans.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/line.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/jbutton.dart';

class ChangePlan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePlan();
  }
}

class _ChangePlan extends State<ChangePlan> {
  @override
  Widget build(BuildContext context) {
    return changePlanUI();
  }

  Widget changePlanUI() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        centerTitle: true,
        title: Text(
          'CAMBIO DE PLAN',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.blue_dark,
            child: Column(
              children: [
                _header(),
                ScrollPlans(scrollDirection: Axis.vertical, children: [
                  {
                    "id": 1,
                    "planName": "5 MB",
                    "priceBs": "Bs 1.1300.450",
                    "priceUsd": "10 USD",
                    "uploadSpeed": "3.5 MB",
                    "downloadSpeed": "5 MB",
                  },
                  {
                    "id": 1,
                    "planName": "10 MB",
                    "priceBs": "Bs 2.1300.450",
                    "priceUsd": "17 USD",
                    "uploadSpeed": "5.5 MB",
                    "downloadSpeed": "10 MB",
                  },
                ]),
                _footer()
              ],
            ),
          ),
        ],
      ),
      endDrawer: LateralMenu(),
    );
  }

  void _serviceRequest() {
    // Navigator.pushNamed(context, '/select-service');
  }

  Widget _header() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(children: [
            Expanded(
              child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "PLANES",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: AppFonts.input,
                        fontSize: 16,
                        color: AppColors.blue_dark),
                  )),
            ),
          ]),
          Line(
            width: 100,
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: JButton(
                  label: "CONTINUAR",
                  onTab: _serviceRequest,
                  top: 30,
                  background: AppColors.green_color,
                ),
              ),
            ),
          ]),
          Line(
            width: 100,
          ),
        ],
      ),
    );
  }
}
