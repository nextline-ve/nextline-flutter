import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/ui/widgets/services.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';

class SelectServiceScreen extends StatelessWidget {
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
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          JTitle(title: "Selecciona"),
                          JTitle(title: "un Servicio"),
                          Line(top: 10,),
                        ],
                      ),
                    ),
                    Services(id:1, name: "EMPRESARIAL"),
                    Services(id:2, name: "RESIDENCIAL"),
                    Services(id:3, name: "DEDICADO"),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }

}