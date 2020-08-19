import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';

class AddressMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddressMap();
  }
  
}

class _AddressMap extends  State<AddressMap > {
  CameraPosition _initialPosition = CameraPosition(target: LatLng(26.8206, 30.8025));
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  JTitle(title: "Instalación",),
                  Line(top: 1,),
                  Container(
                    child: Column(
                      children: [
                        _texts("Ubique en el mapa", 70),
                        _texts("Donde se instalará el servicio", 1),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: _initialPosition,
                    ),
                  )
                ],
              )
            )
        ]
      )
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
  
}