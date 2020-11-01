import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:web_socket_channel/io.dart';
import 'package:workmanager/workmanager.dart';

class GeolocationBackground {
  final Geolocator geo = Geolocator();

  final technicianId;
  IOWebSocketChannel channel;
  Future<Position> getCurrentLocation() async {
    return await geo.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  Future<Map<String, dynamic>> getAddressFromLatLng(
      double latitude, double longitude) async {
    try {
      List<Placemark> p =
          await geo.placemarkFromCoordinates(latitude, longitude);
      Placemark place = p[0];

      String address =
          "Parroquia: ${place.locality} - Estado: ${place.administrativeArea} - "
          "Municipio: ${place.subAdministrativeArea}, Calle: ${place.thoroughfare}";
      return {"latitude": latitude, "longitude": longitude, "address": address};
      // print("${place.thoroughfare}, ${place.subThoroughfare}, ${place.locality}, ${place.subLocality}, ${place.postalCode}, ${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.country}");
    } catch (e) {
      return {
        "latitude": 0,
        "longitude": 0,
        "address": "error podria escribir su dirección por favor."
      };
    }
  }

  GeolocationBackground({this.technicianId}) {
    channel = IOWebSocketChannel.connect(
        'wss://nextline.jaspesoft.com/ws/tecnico/${this.technicianId}/'
    );
    Workmanager.initialize(
        realTimeLocation(), // The top level function, aka callbackDispatcher
        isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
    );
  }

  realTimeLocation() {
    // ignore: cancel_subscriptions
    Geolocator()
        .getPositionStream(
            LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1))
        .listen((Position position) {
      // AQUI VAMOS AGREGAR LA INSTANCIA DEL SOCKET CLIENTE QUE SE CONECTA CON EL ADMIN
      // EN LA APP DE TECNICOS

      this.channel.sink.add({
        "tecnicoId": this.technicianId,
        "latitud": position.latitude,
        "logitud": position.longitude
      });

      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());
    });
  }
}
