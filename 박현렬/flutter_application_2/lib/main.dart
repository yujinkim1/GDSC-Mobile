import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/statefullTest.dart';
import 'package:flutter_application_2/screens/todo.dart';
import 'screens/statelessTest.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: ThemeData(
      useMaterial3: true,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'GDSC-Mobile',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              child: studyContainer(Colors.white, '1주차', 'stateless 위젯'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => statelessTest()));
              },
            ),
            GestureDetector(
              child: studyContainer(Colors.white, '2주차', 'stateful 위젯'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => statefulTest()));
              },
            ),
            GestureDetector(
              child: studyContainer(Colors.white, '3주차', 'todoApp'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Todo()));
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget studyContainer(color, title, des) {
  //홈 카테고리 위젯 버튼
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      alignment: Alignment.center,
      height: 100,
      width: 500,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 160, 114, 225),
            offset: Offset(
              0,
              2.0,
            ),
            blurRadius: 2.0,
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Text(des),
        ],
      ),
    ),
  );
}
