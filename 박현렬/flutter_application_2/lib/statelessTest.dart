import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class statelessTest extends StatelessWidget {
  List<String> names = ['dazy', 'asong', 'bbobby'];
  String input = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DogName('name'),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DogName('name'),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DogName('name'),
              // ),
              for (String i in names)
                Column(
                  children: [
                    DogName(i),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

class DogName extends StatelessWidget {
  final String name;
  const DogName(this.name);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Text(name),
      ),
    );
  }
}
