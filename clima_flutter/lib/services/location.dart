import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();

      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;

      await Geolocator.checkPermission();
    } catch (e) {
      print(e);
    }
  }
}
