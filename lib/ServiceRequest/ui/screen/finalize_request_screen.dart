import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/geolocation_background.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtext_field.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinalizeRequestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FinalizeRequestScreen();
  }
}

class _FinalizeRequestScreen extends State<FinalizeRequestScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _address;
  String _referencePoint;
  double _latitude;
  double _longitude;
  Map<String, dynamic> requestData;

  Future<String> _getAddress() async {
    // _address = await GeolocationBackground().getAddressFromLatLng();
    Map<String, dynamic> data = await GeolocationBackground().getAddressFromLatLng();
    if (data['longitude'] != 0.0) {
      _address = data['address'];
      _latitude = data['latitude'];
      _longitude = data['longitude '];
    }
    return _address;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 109, 186, 1),
        ),
        body: Stack(children: [
          Background(pathImage: "assets/images/bg.jpg"),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JTitle(title: "Domicilio de"),
                  JTitle(title: "Instalación"),
                  Line(top: 1),
                  FutureBuilder(
                    future: _getAddress(),
                    builder: (BuildContext context, AsyncSnapshot <String> snapshot ){
                      if (snapshot.hasData) {
                        return getForm(snapshot.data);
                      }
                      return Padding(
                        padding: EdgeInsets.all(40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );

                    },
                  )

                ],
              ),
            ),
          ),
        ]));
  }
  Widget getForm(String address) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          JTextField(initialValue: address,
            label: "Dirección",
            inputType: TextInputType.multiline,
            onKeyValue: (val) => _address = val,
          ),
          JTextField(
            label: "Punto de Referencia",
            inputType: TextInputType.multiline,
            onKeyValue: (val) => _referencePoint = val,
          ),
          _text("Antes de finalizar confirme", 60),
          _text("si su ubicaciones es correcta", 1),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: JButton(
              label: "FINALIZAR SOLICITUD",
              onTab: _finish,
              background: AppColors.ligth_blue_color,
              icon: Icons.navigate_next,
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

  void _finish() async {
    if (_address == '') {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Verifique que haya cargado su dirección.')));
      return;
    }

    if (_referencePoint != '') {
      _address += ' Punto de referencia: ' + _referencePoint;
    }

    SharedPreferences prefs = await _prefs;
    String data = prefs.getString("dataPersonal");
    requestData = jsonDecode(data);
    requestData['direccion'] = _address;
    requestData['latitud'] = _latitude;
    requestData['longitud'] = _longitude;
  }
}
