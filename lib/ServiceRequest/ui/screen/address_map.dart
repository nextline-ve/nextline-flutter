import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/geolocation_background.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddressMap();
  }
}

class _AddressMap extends State<AddressMap> {
  final Set<Marker> _markers = Set();
  static LatLng _initialPosition;

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _getUserLocation() async {
    Position data = await GeolocationBackground().getCurrentLocation();
    setState(() {
      _initialPosition = LatLng(data.latitude, data.longitude);
      _markers.add(Marker(
          markerId: MarkerId("Locación"),
          position: _initialPosition,
          icon: BitmapDescriptor.defaultMarker));
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
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
                    JTitle(title: "Domicilio de\nInstalación"),
                    Line(
                      top: 1,
                    ),
                    Container(
                        child: Column(
                      children: [
                        _texts("Ubique en el mapa", 40),
                        _texts("dónde se instalará el servicio", 1),
                      ],
                    )),
                    _initialPosition == null
                        ? Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Center(
                              child: Column(
                                children: [
                                  CircularProgressIndicator(),
                                  Text(
                                    'Cargando mapa...',
                                    style: TextStyle(
                                        fontFamily: 'fontTitle',
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ))
                        : Flexible(
                            child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  _maps(),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: JButton(
                                      label: "CONTINUAR",
                                      onTab: _continue,
                                      background: AppColors.ligth_blue_color,
                                      icon: Icons.navigate_next,
                                    ),
                                  ),
                                ]),
                          ),
                  ])),
        ]));
  }

  Widget _maps() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: GoogleMap(
        gestureRecognizers: Set()
          ..add(
              Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
        mapType: MapType.hybrid,
        markers: _markers,
        onMapCreated: _onMapCreated,
        compassEnabled: true,
        initialCameraPosition:
            CameraPosition(target: _initialPosition, zoom: 18),
        onTap: (latLng) {
          print("Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}");
          setState(() {
            _initialPosition = latLng;
            _markers.add(Marker(
                markerId: MarkerId("Locación"),
                position: latLng,
                icon: BitmapDescriptor.defaultMarker));
          });
        },
      ),
    );
  }

  Widget _texts(String title, double top) {
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

  void _continue() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    String data = prefs.getString("dataPersonal");
    Map<String, dynamic> dataAux = jsonDecode(data);
    prefs.remove("dataPersonal");
    dataAux['latitud'] = _initialPosition.latitude;
    dataAux['longitud'] = _initialPosition.longitude;
    prefs.setString("dataPersonal", jsonEncode(dataAux));

    Navigator.pushNamed(context, '/finalize-request');
  }
}
