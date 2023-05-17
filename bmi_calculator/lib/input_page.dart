import 'package:bmi_calculator/style.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: MyColumn(
        children: [
          const Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: MyColumn(
                children: [
                  Expanded(
                    child: MyRow(
                      children: [
                        MyWidget(child: Text('data')),
                        MyWidget(),
                      ],
                    ),
                  ),
                  MyWidget(),
                  Expanded(
                    child: MyRow(
                      children: [
                        MyWidget(),
                        MyWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'CALCULATE',
                style: Palette.titleTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
