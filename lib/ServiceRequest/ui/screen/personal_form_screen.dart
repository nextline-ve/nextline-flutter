import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/ui/widgets/form_personal.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';

class PersonalFormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersonalFormScreen();
  }
}

class _PersonalFormScreen extends State<PersonalFormScreen> {
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
                    JTitle(title: "Formulario"),
                    JTitle(title: "Personal"),
                    Line(top: 1),
                    FormPersonal(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
