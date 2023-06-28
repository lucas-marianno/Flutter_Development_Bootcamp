import 'package:geolocator/geolocator.dart';

class Location {
  late double lat;
  late double lon;

  late String status;

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
      lat = 0;
      lon = 0;
    }
  }
}
