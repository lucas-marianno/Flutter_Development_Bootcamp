import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/dialog_alerts.dart';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location gpsLocation = Location();
    await gpsLocation.getCurrentLocation();

    WeatherModel weatherModel = WeatherModel();
    if (gpsLocation.status == 'success') {
      await weatherModel.setLocation(gpsLocation.lat, gpsLocation.lon);
      exitLoadingScreen(weatherModel);
    } else {
      // ignore: use_build_context_synchronously
      ({num lat, num lon}) manualLocation = await locationErrorDialog(context, gpsLocation.status);
      await weatherModel.setLocation(manualLocation.lat, manualLocation.lon);
      exitLoadingScreen(weatherModel);
    }
  }

  void exitLoadingScreen(weatherModel) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(weatherModel)));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
      )),
    );
  }
}
