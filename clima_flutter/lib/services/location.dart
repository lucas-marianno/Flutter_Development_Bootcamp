import 'package:geolocator/geolocator.dart';

class Location {
  double lat = 0;
  double lon = 0;
  String status = 'null';

  getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();

      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      lat = position.latitude;
      lon = position.longitude;
      status = 'success';
      await Geolocator.checkPermission();
    } catch (e) {
      status = e.toString();
    }
  }
}
