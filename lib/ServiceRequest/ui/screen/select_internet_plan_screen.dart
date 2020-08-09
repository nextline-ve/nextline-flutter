import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/ui/widgets/plans.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';

class SelectInternetPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 109, 186, 1),
      ),
      body: Stack(
        children: [
          Background(),
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
                  Container(
                    height: 295,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Plans(
                          id: 1,
                          plan_name: "5 MB",
                          price_bs: "Bs 1.1300.450",
                          price_usd: "10 USD",
                          upload_speed: "3.5 MB",
                          download_speed: "5 MB",
                        ),
                        Plans(
                          id: 1,
                          plan_name: "10 MB",
                          price_bs: "Bs 2.1300.450",
                          price_usd: "17 USD",
                          upload_speed: "5.5 MB",
                          download_speed: "10 MB",
                        ),
                      ],
                    ),
                  ),
                  _Text("Selecciona el plan", 30),
                  _Text("de tu preferencia", 1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _Text(txt, double top) {
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
