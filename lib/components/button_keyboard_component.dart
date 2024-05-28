import 'package:flutter/material.dart';
import '../values/colors_values.dart';

class ButtonKeyboard extends StatelessWidget {
  final String textButton;
  final bool buttonDoubleRow;
  final Color colorButton;
  final void Function(String) callbackFunction;

  const ButtonKeyboard({
    super.key,
    required this.textButton,
    this.buttonDoubleRow = false,
    this.colorButton = ColorsValues.BUTTONDEFAULTCOLOR,
    required this.callbackFunction,
  });
  // CONSTRUTORES NOMEADOS
  const ButtonKeyboard.doubleRow({
    super.key,
    required this.textButton,
    this.buttonDoubleRow = true,
    this.colorButton = ColorsValues.BUTTONDEFAULTCOLOR,
    required this.callbackFunction,
  });

  const ButtonKeyboard.operator({
    super.key,
    required this.textButton,
    this.buttonDoubleRow = false,
    this.colorButton = ColorsValues.BUTTONOPERATORTCOLOR,
    required this.callbackFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: buttonDoubleRow ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: colorButton,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            )),
        onPressed: () => callbackFunction(textButton),
        child: Text(
          textButton,
          style: const TextStyle(
            color: ColorsValues.BUTTONTEXTCOLOR,
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
