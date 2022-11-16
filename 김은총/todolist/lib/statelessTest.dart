// lib/statelessTest.dart 파일

import 'package:flutter/material.dart';  // 플러터의 위젯들이 들어있는 파일

class statelessTest extends StatelessWidget {
  final List<String> names = ['bbobby', 'bbibbo', 'apple', 'banana'];
  
  @override
  Widget build(BuildContext context) {
		// Center 위젯을 반환
    return Container(
			// Center 자식으로 Column 위젯을 넣음
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
				// Column 위젯 자식으로 반복문을 사용하여 DogNameBox를 넣음
        children: [
          for (String i in names) DogNameBox(i, 10)
        ],
      )
    );
  }
}

class DogNameBox extends StatelessWidget {
  final String name;
  final double height;

	// 생성자
  const DogNameBox(this.name, this.height); //height가 공백 역할을 한다

  @override
  Widget build(BuildContext context) {
		// Column 위젯을 반환
    return Column(
			// Column 자식으로 DogName과 SizedBox(크기가 있는 박스)를 반환
      children: [
        DogName(name),
        SizedBox(height: height),
      ],
    );
  }
}

class DogName extends StatelessWidget {
  // 이름 변수
  final String name;
  
  // 생성자
  const DogName(this.name); //DogName vs. DogNameBox

  @override
  Widget build(BuildContext context) {
		// DecoratedBox(꾸밀 수 있는 박스)를 반환
    return DecoratedBox(
			// BoxDecoration으로 꾸밈 속성(색깔)을 설정
      decoration: BoxDecoration(color: Colors.cyanAccent),
			// DecoratedBox 자식으로 Padding 위젯을 넣음.
      child: Padding(
				// Padding 값을 상하좌우 8로 세팅
        padding: EdgeInsets.all(8.0),
				// Padding 자식으로 Text 위젯을 넣음.
        child: Text(name),
      ),
    );
  }
}