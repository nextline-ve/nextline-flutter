import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/bloc/bloc_service_request.dart';
import 'package:nextline/ServiceRequest/ui/widgets/scrollPlans.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';

class SelectInternetPlanScreen extends StatelessWidget {
  BlocServiceRequest bloc = BlocServiceRequest();

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
                  StreamBuilder(
                    stream: bloc.listPlans,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ScrollPlans(scrollDirection: Axis.horizontal, children: snapshot.data);
                      }
                      return Container(
                        margin: EdgeInsets.only(top: 30),
                          child:
                          Center(child: CircularProgressIndicator()));
                    },
                  ),
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
