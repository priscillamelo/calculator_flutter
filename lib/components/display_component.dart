import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../values/colors_values.dart';

class DisplayComponent extends StatelessWidget {
  final String textDisplay;
  const DisplayComponent(this.textDisplay, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: ColorsValues.DISPLAYCOLOR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                textDisplay,
                minFontSize: 20,
                maxFontSize: 80,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none,
                  fontSize: 80,
                  color: ColorsValues.TEXTDISPLAYCOLOR,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
