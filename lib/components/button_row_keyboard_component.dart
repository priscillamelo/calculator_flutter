import 'package:flutter/material.dart';

import 'button_keyboard_component.dart';

class ButtonRowKeyboardComponent extends StatelessWidget {
  final List<ButtonKeyboard> listButtons;

  const ButtonRowKeyboardComponent(this.listButtons, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: listButtons.fold(<Widget>[], (list, button) {
          list.isEmpty
              ? list.add(button)
              : list.addAll([const SizedBox(width: 1), button]);
          return list;
        }),
      ),
    );
  }
}
