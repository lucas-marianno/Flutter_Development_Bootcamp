import 'package:flutter/material.dart';
import '../widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 200.0,
              child: Hero(tag: 'logo', child: Image.asset('images/logo.png')),
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedTextField(
              hint: 'Enter your email',
              outlineColor: Colors.lightBlueAccent,
              onChanged: (value) {
                //Do something with the user input.
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            RoundedTextField(
              hint: 'Enter your password.',
              outlineColor: Colors.lightBlueAccent,
              onChanged: (value) {
                //Do something with the user input.
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              label: 'Log in',
              color: Colors.lightBlueAccent,
              onPressed: () {
                //Implement login functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}
