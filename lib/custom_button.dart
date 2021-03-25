import "package:flutter/material.dart";

import './buttons.dart';

class CustomButton extends StatelessWidget {
  final ButtonText _buttonText;
  final Function _clickHandler;

  CustomButton(this._buttonText, this._clickHandler);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        // alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: _clickHandler,
          child: _buttonText,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey[400]),
            foregroundColor: MaterialStateProperty.all(Colors.black54),
          ),
        ),
      );
}
