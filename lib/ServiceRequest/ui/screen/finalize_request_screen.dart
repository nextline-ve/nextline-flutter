import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/ui/widgets/form_location.dart';
import 'package:nextline/utils/geolocation_background.dart';
import 'package:nextline/widgets/background.dart';
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
  Map<String, dynamic> _requestData;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    SharedPreferences prefs = await _prefs;
    String data = prefs.getString("dataPersonal");
    _requestData = jsonDecode(data);
  }

  Future<String> _getAddress() async {
    Map<String, dynamic> data =
        await GeolocationBackground().getAddressFromLatLng();
    if (data['longitude'] != 0.0) {
      _requestData['direccion'] = data['address'];
      _requestData['latitud'] = data['latitude'];
      _requestData['longitud'] = data['longitude'];
      print(_requestData);
      print("colocando las geolocalizacion");
    }
    return jsonEncode(_requestData);
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
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        Map<String, dynamic> data = jsonDecode(snapshot.data);
                        return FormLocation(
                          address: data['direccion'],
                          requestData: data,
                        );
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
}
