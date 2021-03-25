import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;

  ButtonText(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(fontSize: 10),
        // textAlign: TextAlign.left,
      );
}
