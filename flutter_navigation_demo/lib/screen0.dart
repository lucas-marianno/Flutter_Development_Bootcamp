import 'package:flutter/material.dart';
import 'package:flutter_navigation_demo/screen2.dart';

class Screen0 extends StatelessWidget {
  const Screen0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Screen 0'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Go To Screen 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
            ),
            ElevatedButton(
              child: const Text('Go To Screen 2'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Screen2()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
