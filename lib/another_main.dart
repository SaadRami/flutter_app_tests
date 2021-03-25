import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  var p = Person.veryOld(name: "test");
}

class MyApp extends StatelessWidget {
  static final String APP_TITLE = "Incidents";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: APP_TITLE);
  }
}

class Person {
  String name;
  int age;

  Person({this.name, this.age});
  Person.veryOld({this.name}) {
    age = 50;
  }
}
