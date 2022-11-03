import 'package:flutter/material.dart';
import 'package:pj1/statelessTest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("김수빈"),
        ),
        body: Center(
          child: statelessTest(),
        ),
      ),
    );
  }
}
