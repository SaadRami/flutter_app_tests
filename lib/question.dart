import "package:flutter/material.dart";

class Question extends StatelessWidget {
  final String _text;

  Question(this._text);

  @override
  Widget build(BuildContext context) => Container(
        child: Text(
          _text,
          style: TextStyle(
            color: Colors.red[700],
            fontSize: 15,
          ),
        ),
      );
}
