import 'package:flutter/material.dart';
import 'package:flutter_01/stateButton.dart';
import 'package:flutter_01/statelessTest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            // 맨위에 있는 바
            title: const Text('박진희 어플'),
          ),
          body: stateButton()),
    );
  }
}
