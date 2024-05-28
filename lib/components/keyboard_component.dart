import 'package:flutter/material.dart';
import 'button_keyboard_component.dart';
import 'button_row_keyboard_component.dart';
import '../values/colors_values.dart';

class KeyboardComponent extends StatelessWidget {
  final void Function(String) callback;

  const KeyboardComponent(this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      color: ColorsValues.KEYBOARDCOLOR,
      child: Column(
        children: [
          ButtonRowKeyboardComponent([
            ButtonKeyboard.doubleRow(
              textButton: 'AC',
              colorButton: ColorsValues.BUTTONDARKCOLOR,
              callbackFunction: callback,
            ),
            ButtonKeyboard(
              textButton: '%',
              colorButton: ColorsValues.BUTTONDARKCOLOR,
              callbackFunction: callback,
            ),
            ButtonKeyboard.operator(
              textButton: '/',
              callbackFunction: callback,
            ),
          ]),
          const SizedBox(height: 1),
          ButtonRowKeyboardComponent([
            ButtonKeyboard(
              textButton: '7',
              callbackFunction: callback,
            ),
            ButtonKeyboard(
              textButton: '8',
              callbackFunction: callback,
            ),
            ButtonKeyboard(
              textButton: '9',
              callbackFunction: callback,
            ),
            ButtonKeyboard.operator(
              textButton: 'x',
              callbackFunction: callback,
            ),
          ]),
          const SizedBox(height: 1),
          ButtonRowKeyboardComponent([
            ButtonKeyboard(
              textButton: '4',
              callbackFunction: callback,
            ),
            ButtonKeyboard(
              textButton: '5',
              callbackFunction: callback,
            ),
            ButtonKeyboard(
              textButton: '6',
              callbackFunction: callback,
            ),
            ButtonKeyboard.operator(
              textButton: '-',
              callbackFunction: callback,
            ),
          ]),
          const SizedBox(height: 1),
          ButtonRowKeyboardComponent([
            ButtonKeyboard(
              textButton: '1',
              callbackFunction: callback,
            ),
            ButtonKeyboard(
              textButton: '2',
              callbackFunction: callback,
            ),
            ButtonKeyboard(
              textButton: '3',
              callbackFunction: callback,
            ),
            ButtonKeyboard.operator(
              textButton: '+',
              callbackFunction: callback,
            ),
          ]),
          const SizedBox(height: 1),
          ButtonRowKeyboardComponent([
            ButtonKeyboard.doubleRow(
              textButton: '0',
              callbackFunction: callback,
            ),
            ButtonKeyboard(
              textButton: '.',
              callbackFunction: callback,
            ),
            ButtonKeyboard.operator(
              textButton: '=',
              callbackFunction: callback,
            ),
          ]),
        ],
      ),
    );
  }
}
