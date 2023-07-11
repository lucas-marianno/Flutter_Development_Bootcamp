import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/welcome_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  static String name = 'loading';

  @override
  Widget build(BuildContext context) {
    finishedLoading() async {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, WelcomeScreen.name);
      });
    }

    finishedLoading();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedTextKit(
          repeatForever: true,
          isRepeatingAnimation: true,
          pause: const Duration(milliseconds: 200),
          animatedTexts: [
            TyperAnimatedText(
              '...',
              speed: const Duration(milliseconds: 200),
              textStyle: const TextStyle(
                fontSize: 100,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
