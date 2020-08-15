import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/ui/widgets/plans.dart';
import 'package:nextline/ServiceRequest/ui/widgets/scrollPlans.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';

class SelectInternetPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 109, 186, 1),
      ),
      body: Stack(
        children: [
          Background(pathImage: "assets/images/bg.jpg"),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JTitle(title: "Planes de"),
                  JTitle(title: "Internet"),
                  Line(top: 10),
                  ScrollPlans(scrollDirection: Axis.horizontal, children: [
                    Plans(
                      id: 1,
                      planName: "5 MB",
                      priceBs: "Bs 1.1300.450",
                      priceUsd: "10 USD",
                      uploadSpeed: "3.5 MB",
                      downloadSpeed: "5 MB",
                    ),
                    Plans(
                      id: 1,
                      planName: "10 MB",
                      priceBs: "Bs 2.1300.450",
                      priceUsd: "17 USD",
                      uploadSpeed: "5.5 MB",
                      downloadSpeed: "10 MB",
                    ),
                  ]),
                  _text("Selecciona el plan", 30),
                  _text("de tu preferencia", 1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _text(txt, double top) {
    return Container(
      margin: EdgeInsets.only(top: top),
      child: Center(
          child: Text(
        txt,
        style: TextStyle(
            fontFamily: "fontTitle", color: Colors.white, fontSize: 20),
      )),
    );
  }
}
