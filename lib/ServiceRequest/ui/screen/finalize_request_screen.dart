import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  GeolocationBackground _geolocaion = GeolocationBackground();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    SharedPreferences prefs = await _prefs;
    String data = prefs.getString("dataPersonal");
    Map<String, dynamic> dataAux = jsonDecode(data);
    print(dataAux);
    if (dataAux['latitud'] == 0) {
      Position  position = await _geolocaion.getCurrentLocation();
      Map<String, dynamic> dataAddress = await _geolocaion.getAddressFromLatLng(position.latitude, position.longitude);
      if (dataAddress['longitude'] != 0.0) {
        dataAux['direccion'] = dataAddress['address'];
        dataAux['latitud'] = dataAddress['latitude'];
        dataAux['longitud'] = dataAddress['longitude'];
      }
    }  else {
      Map<String, dynamic> addr = await _geolocaion.getAddressFromLatLng(dataAux['latitud'], dataAux['longitud']);
      dataAux['direccion'] = addr['address'];
    }
    

    setState(() {
      _requestData = dataAux;
    });



  }

  @override
  Widget build(BuildContext context) {
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
                  _requestData == null
                      ? Padding(
                          padding: EdgeInsets.all(40),
                          child: Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Espere un momento, estamos tomando su ubicación...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'fontTitle',
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ))
                      : FormLocation(
                          address: _requestData['direccion'],
                          requestData: _requestData,
                        )
                ],
              ),
            ),
          ),
        ]));
  }
}
