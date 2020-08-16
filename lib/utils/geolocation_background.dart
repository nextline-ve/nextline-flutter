import 'dart:async';
import 'package:geolocator/geolocator.dart';

class GeolocationBackground {
  final Geolocator geo = Geolocator();

  Future<Position> getCurrentLocation() async {
    return await geo.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  Future<Map<String, dynamic>> getAddressFromLatLng() async {
    try {
      Position position = await getCurrentLocation();
      List<Placemark> p = await geo.placemarkFromCoordinates(
          position.latitude, position.longitude);
      Placemark place = p[0];

      String address = "Parroquia: ${place.locality} - Estado: ${place.administrativeArea} - "
          "Municipio: ${place.subAdministrativeArea}";
      return {
        "latitude": position.latitude,
        "longitude": position.longitude,
        "address": address
      };
      /*return "${place.thoroughfare}, ${place.subThoroughfare}, ${place.locality}, ${place.subLocality}, ${place.postalCode},  "
          "${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.country}";*/
    } catch(e) {
      return {
        "latitude": 0,
        "longitude": 0,
        "address": "error podria escribir su dirección por favor."
      };
    }

  }

  realTimeLocation() {
    // ignore: cancel_subscriptions
    StreamSubscription<Position> realTimePositionStream = Geolocator()
        .getPositionStream(
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1))
        .listen((Position position) {
      // AQUI VAMOS AGREGAR LA INSTANCIA DEL SOCKET CLIENTE QUE SE CONECTA CON EL ADMIN
      // EN LA APP DE TECNICOS
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() + ', ' + position.longitude.toString());
    });
  }
}
