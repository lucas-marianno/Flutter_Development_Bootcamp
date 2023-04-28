import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool id;
  final Function function;
  const CustomButton(this.id, {required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    final String buttonName = id ? 'True' : 'False';
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: id ? Colors.green : Colors.red,
          ),
          onPressed: () => function(),
          child: Text(
            buttonName,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
