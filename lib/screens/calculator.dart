import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import '../models/memory_calculator.dart';
import '../components/display_component.dart';
import '../components/keyboard_component.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final MemoryCalculator memoryCalculator = MemoryCalculator();

  @override
  Widget build(BuildContext context) {
/*     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]); */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            DisplayComponent(memoryCalculator.valueDisplay),
            KeyboardComponent(_onPressedButton),
          ],
        ),
      ),
    );
  }

  _onPressedButton(String valueButton) {
    setState(() {
      memoryCalculator.applyCommand(valueButton);
    });
  }
}
