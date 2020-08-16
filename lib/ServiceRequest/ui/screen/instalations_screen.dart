import 'package:flutter/material.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';

class InstallationsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InstallationsScreen();
  }
}

class _InstallationsScreen extends State<InstallationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 109, 186, 1),
      ),
      body: Stack(
        children: [
          Background(pathImage: "assets/images/bg.jpg"),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JTitle(title: "Domicilio de"),
                JTitle(
                  title: "Instalación",
                ),
                Line(
                  top: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _textos("¿Esta usted en el sitio donde se", 70),
                    _textos("va a instalar el servicios?", 1)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _textos(String title, double top) {
    return Container(
      margin: EdgeInsets.only(top: top),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: "fontSubTitle"),
        ),
      ),
    );
  }
}
