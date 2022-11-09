import 'package:flutter/material.dart';

class statelessTest extends StatelessWidget {
  List<String> names = ['a', 'b', 'c', 'd'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(String i in names) Padding(
              padding: EdgeInsets.all(10),
              child : DogName(i)),
      ]
    ));
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
      decoration: BoxDecoration(color: Colors.lightBlueAccent,
      border : Border.all(color: Colors.black,
        style: BorderStyle.solid,
        width: 2),
        borderRadius: BorderRadius.circular(10.0)
        ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        
        child: Text(name)
      ),
    );
  }
}
