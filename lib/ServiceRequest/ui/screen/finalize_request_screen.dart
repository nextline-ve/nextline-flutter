import 'package:flutter/material.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';

class FinalizeRequestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FinalizeRequestScreen();
  }
}

class _FinalizeRequestScreen extends State<FinalizeRequestScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 109, 186, 1),
        ),
        body: Stack(children: [
          Background(pathImage: "assets/images/bg.jpg"),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JTitle(title: "Domicilio de"),
                JTitle(title: "Instalación"),
                Line(top: 1),
              ],
            ),
          ),
        ]));
  }
}
