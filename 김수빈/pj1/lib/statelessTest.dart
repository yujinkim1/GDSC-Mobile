import 'package:flutter/material.dart';

class statelessTest extends StatelessWidget {
  List<String> names = ["subin", "sub", "subb"];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (String i in names) DogNameBox(i, 20),
    ]));
  }
}

class DogNameBox extends StatelessWidget {
  final String name;
  final double height;

  const DogNameBox(this.name, this.height);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [DogName(name), SizedBox(height: height)],
    );
  }
}

class DogName extends StatelessWidget {
  //이름 변수
  final String name;
  //생성자
  const DogName(this.name);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(name),
      ),
    );
  }
}
