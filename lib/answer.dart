import "package:flutter/material.dart";

class Answer extends StatelessWidget {
  final String _buttonText;
  final Function _onClick;

  Answer(this._buttonText, this._onClick);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 20,
          right: 50,
          left: 50,
        ),
        // alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: _onClick,
          child: Text(_buttonText),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreen[400]),
            foregroundColor: MaterialStateProperty.all(Colors.black54),
          ),
        ),
      );
}
