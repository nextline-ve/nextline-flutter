import 'dart:async';
import 'package:geolocator/geolocator.dart';

class GeolocationBackground {
  final Geolocator geo = Geolocator();

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
        "address": "error podría escribir su dirección por favor."
      };
    }
  }

}
