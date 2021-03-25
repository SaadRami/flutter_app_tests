import 'package:flutter/material.dart';
import 'package:incidents_app/res/app_consts.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerTheQuestion;

  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerTheQuestion,
  });

  @override
  Widget build(BuildContext context) => Container(
        // margin: EdgeInsets.only(left: 50),
        // padding: EdgeInsets.only(top: 5),
        // alignment: Alignment.center,
        child: Column(
          children: [
            Question(
              questions[questionIndex][AppConstants.QUESTION_KEY],
            ),
            ...(questions[questionIndex][AppConstants.ANSWER_KEY]
                    as List<Map<String, Object>>)
                .map(
              (answer) {
                return Answer(
                  answer[AppConstants.ANSWER_STR_KEY],
                  () => answerTheQuestion(
                    answer[AppConstants.SCORE],
                  ),
                );
              },
            )
          ],
        ),
      );
}
