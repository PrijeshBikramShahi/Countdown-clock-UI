import 'package:flutter/material.dart';
import 'package:stateful_ui/timertest.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerTry(),
    );
  }
}
