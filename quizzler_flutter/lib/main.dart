import 'package:flutter/material.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Prompt(),
          CustomButton('True', function: () {}),
          CustomButton('False', function: () {}),
        ],
      ),
    );
  }
}

class Prompt extends StatelessWidget {
  const Prompt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        flex: 5,
        child: Center(child: Text('This is where the question text will go')));
  }
}

class CustomButton extends StatelessWidget {
  final String id;
  final Function function;
  const CustomButton(this.id, {required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(onPressed: () => function, child: Text(id)),
    ));
  }
}
