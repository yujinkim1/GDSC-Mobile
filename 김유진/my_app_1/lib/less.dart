import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  //MARK: 1-NAME VAR
  final String name;
  //MARK: 2-CONSTRUCTOR
  const Label(this.name);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(25.0)),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class Less extends StatelessWidget {
  List<String> names = ["Beluga", "Kiki", "Goovy", "Meril"];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //MARK: 3-LABEL LOOP IN NAMES
        for (String index in names)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Label(index),
          ),
      ],
    );
  }
}
