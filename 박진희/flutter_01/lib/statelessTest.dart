import 'package:flutter/material.dart';

// Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       DogName('name')
//     ],
//   )
// )

class statelessTest extends StatelessWidget {
  List<String> names = ['bbobby', 'bbibbbo', 'apple', 'banana'];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //DogName('bbobby'), DogName('bbibbbo'), DogName('apple')],

        // 따로 위젯 만들어서 여백 만들기
        //for (String i in names) DogNameBox(i, 30),

        // 위젯 만들지 않고 여백 만들기
        for (String i in names)
          Column(
            children: [
              DogName(i),
              SizedBox(
                height: 10,
              )
            ],
          )
      ],
    ));
  }
}

// 반복문 사이에 여백 만들어주기 (글이랑 여백을 포함하는 위젯임)(padding으로 감싸는 코드 써도 됨)
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
  // 이름 변수
  final String name;

  // 생성자
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
