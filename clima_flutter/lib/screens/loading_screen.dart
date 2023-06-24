import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Position position;
  late LocationPermission permission;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    permission = await Geolocator.checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print(position);
            print(permission);
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
