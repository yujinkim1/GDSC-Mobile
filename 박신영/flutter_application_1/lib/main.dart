import 'package:flutter/material.dart';
import 'package:flutter_application_1/stateButton.dart';
import 'package:flutter_application_1/statelessTest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar( //제일 상위에 있는 바
          title: const Text("박신영"),  // title은 그 상위 바에 뭐를 넣을 것인지.
        ),
        body: stateButton()
      ),
    );
  }
}