import 'package:flutter/material.dart';

import './res/app_consts.dart';
import './Answer.dart';

class Result extends StatelessWidget {
  final Function _onAgainClick;
  final int totalScore;

  Result(
    @required this._onAgainClick,
    @required this.totalScore,
  );

  String get scoreStatement {
    String output;
    if (totalScore > 200 && totalScore <= 218) {
      output = "Très bon choix !";
    } else if (totalScore > 100 && totalScore <= 200) {
      output = "Pas mal !";
    } else {
      output = "Noob. xD";
    }

    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Score : $totalScore !!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red[600],
            ),
          ),
          Text(
            scoreStatement,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: _onAgainClick,
            child: Text("Refaire le quizz !"),
          ),
        ],
      ),
    );
  }
}
