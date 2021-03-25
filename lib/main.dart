import 'package:flutter/material.dart';
import 'package:incidents_app/answer.dart';
import 'package:incidents_app/question.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import './buttons.dart';
import './custom_button.dart';
import './features/general/presentation/pages/pages/login.dart';
import './providers.dart';
import './quiz.dart';
import './result.dart';
import './res/app_consts.dart';

void main() {
  debugPrint("two = ${two()}");
  runApp(QuizzApp());
}

int two() => 1 + 1;

class QuizzApp extends StatefulWidget {
  @override
  _QuizzAppState createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  var _totalScore = 0;

  var _buttonTextsIndex = 0;
  var _questionIndex = 0;

  var _buttonMap = {
    "A": "Button A",
    "B": "Button B",
  };

  var _buttonTexts = [
    "Button1",
    "Button2",
  ];

  final _questions = const [
    {
      AppConstants.QUESTION_KEY: "Quel est votre animé préféré ?",
      AppConstants.ANSWER_KEY: [
        {
          AppConstants.ANSWER_STR_KEY: "Claymore",
          AppConstants.SCORE: 50,
        },
        {
          AppConstants.ANSWER_STR_KEY: "Bleach",
          AppConstants.SCORE: 60,
        },
        {
          AppConstants.ANSWER_STR_KEY: "Elfen lied",
          AppConstants.SCORE: 50,
        },
        {
          AppConstants.ANSWER_STR_KEY: "Ergo proxy",
          AppConstants.SCORE: 99,
        },
      ],
    },
    {
      AppConstants.QUESTION_KEY:
          "Quel est votre genre de jeux vidéos préféré ?",
      AppConstants.ANSWER_KEY: [
        {
          AppConstants.ANSWER_STR_KEY: "Survival Horror",
          AppConstants.SCORE: 10,
        },
        {
          AppConstants.ANSWER_STR_KEY: "J-RPG",
          AppConstants.SCORE: 99,
        },
        {
          AppConstants.ANSWER_STR_KEY: "Action RPG",
          AppConstants.SCORE: 99,
        },
        {
          AppConstants.ANSWER_STR_KEY: "Plateformer",
          AppConstants.SCORE: 30,
        },
      ],
    },
    {
      AppConstants.QUESTION_KEY:
          "Quel est votre langage de programmation préféré ?",
      AppConstants.ANSWER_KEY: [
        {
          AppConstants.ANSWER_STR_KEY: "Java",
          AppConstants.SCORE: 20,
        },
        {
          AppConstants.ANSWER_STR_KEY: "C#",
          AppConstants.SCORE: 5,
        },
        {
          AppConstants.ANSWER_STR_KEY: "Dart",
          AppConstants.SCORE: 18,
        },
        {
          AppConstants.ANSWER_STR_KEY: "Javascript",
          AppConstants.SCORE: 1,
        },
      ]
    },
  ];

  void _answerTheQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });
  }

  void _again() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _changeButtonsState() {
    if (_buttonTextsIndex == 1) {
      setState(() => _buttonTextsIndex = 0);
      return;
    }

    setState(() => _buttonTextsIndex++);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Derp"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerTheQuestion: _answerTheQuestion,
              )
            : Result(_again, _totalScore),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Incidents App',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              buttonColor: Colors.blue,
              inputDecorationTheme:
                  InputDecorationTheme(border: OutlineInputBorder()),
              buttonTheme: ButtonThemeData(
                  height: 50.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))),
          home: LoginPage(),
        ));
  }
}
