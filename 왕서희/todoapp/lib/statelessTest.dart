import 'package:flutter/material.dart';

class statelessTest extends StatelessWidget {
  List<String> names = ['bbobby', 'choco', 'apple', 'banana'];

  @override
  Widget build(BuildContext context) {
    //return Text("asdf");
    //return DogName("bbobby");
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (String i in names)
          Column(
            children: [
              DogName(i), //DogName(i, 10)
              SizedBox(
                height: 10,
              )
            ],
          ),
      ],
      //DogName("bbobby"), DogName("choco"), DogName("apple")],
    ));
  }
}

// class DogNameBox extends StatelessWidget {
//   final String name;
//   final double height;

//   const DogNameBox(this.name, this.height);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DogName(name),
//         SizedBox(
//           height: height,
//         )
//       ],
//     );
//   }
// }

class DogName extends StatelessWidget {
  //이름변수
  final String name;
  //생성자
  const DogName(this.name);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.cyanAccent),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(name),
      ),
    );
  }
}
