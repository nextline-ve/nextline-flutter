import 'package:flutter/material.dart';
import 'package:nextline/apps/ServiceRequest/ui/widgets/services.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jtitle.dart';

class SelectionServiceScreen extends StatelessWidget {
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
                margin: EdgeInsets.only(top: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      child: Column(
                        children: [
                          JTitle(title: "Selecciona"),
                          JTitle(title: "un Servicio"),
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