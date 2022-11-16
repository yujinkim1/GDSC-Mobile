import 'package:flutter/material.dart';
import './stateButton.dart';
import './less.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //MARK: 1-MyApp()
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              centerTitle: false,
              title: const Text(
                "Labels",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            body: Center(child: stateButton())));
  }
}
