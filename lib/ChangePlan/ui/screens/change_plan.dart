import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/screens/home_screen.dart';
import 'package:nextline/ServiceRequest/bloc/bloc_service_request.dart';
import 'package:nextline/ServiceRequest/ui/widgets/scrollPlans.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/lateral_menu.dart';

class ChangePlan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePlan();
  }
}

class _ChangePlan extends State<ChangePlan> {
  BlocServiceRequest blocService = BlocServiceRequest();

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
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Background(pathImage: "assets/images/bg.jpg"),
          Column(
            children: [
              _header(),
              StreamBuilder(
                  stream: blocService.listPlans,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ScrollPlans(
                        scrollDirection: Axis.vertical,
                        children: snapshot.data,
                        pushUrl: '/confirm-change-plan',
                      );
                    }
                    return Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Center(child: CircularProgressIndicator()));
                  }),
            ],
          ),
        ],
      ),
      endDrawer: LateralMenu(),
    );
  }

  Widget _header() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(children: [
            Expanded(
              child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "SELECCIONA TU NUEVO PLAN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: AppFonts.input,
                        fontSize: 16,
                        color: Colors.white),
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
