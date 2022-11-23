
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/stateButton.dart';
// import 'package:flutter_application_1/statelessTest.dart'

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home : Scaffold(
//         appBar: AppBar( //제일 상위에 있는 바
//           title: const Text("박신영"),  // title은 그 상위 바에 뭐를 넣을 것인지.
//         ),
//         body: stateButton()
//       ),
//     );
//   }
// }

//가장 위 status bar
//그 하단 todo 이름 표시해주는 것이 appbar

import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,  // 디버그 배너 없애기
  theme: ThemeData(colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    accentColor: Colors.orange,
    )
  ),

  // theme: ThemeData(
  //   brightness: Brightness.light,  //dark하면 설정한 색들이 사라지고, light를 적용하였을 때 보여짐.
  //   primarySwatch: Colors.indigo, //primaryColor이 안된다면 aprimarySwatch컬러로 적용
  //   accentColor:Color.fromARGB(255, 108, 209, 237)),
  //   // accentColor는 하단 +버튼의 색상을 결정

  home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
  //위처럼 _(언더바)를 사용한다는 것은 private하게 사용하기 위함(?)이다.
}

class _MyappState extends State<MyApp> {
  List<String> todos = []; 
    //List<String> todos = ["Item1", "Item2", "Item3"]; 
    // 이렇게 하여도 밑에 override구문을 실행한 결과와 같다.
  String input = "";


  @override
  void initState() {
    // api 호출을 할 때에 용이하게 사용하는 함수가 initState()이다.
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
    todos.add("Item3");
    todos.add("Item4");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Park_todo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(   // showDialog 역시 화면전환(navigator)이 이루어진다.
            context: context, // 이 context는 showDialog의 위치 정보를 가지고,
            builder: (BuildContext context) { // 여기 context는 아래 AlertDialog의 위치 정보를 가지고 있다.
              return AlertDialog(
                title: Text("Add_todoList"),
                content: TextField(onChanged: (String value) {  //onchanged가 실행되려면 입력된 값이 바뀌어야 아래 input이 실행되고 공백이 들어가는데, 
                                                                //값이 바뀌지 않고 공백으로 add를 한다면 이전 쓰였던 것이 그대로 다시 쓰이게 되는 것. 
                    input = value;
                  },
                ),
                actions: <Widget> [
                  TextButton(
                    onPressed: onPressed_add,
                    child: Text("Add")
                    )
                ]
              );
            }
          );
        },
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 105, 167, 219),
        )
    
      ),
      body: test()
    );
  }

//과제 : _MyappState 에 몰려있는 코드를 위젯으로 분리하여 보자.

//#1번 void 활용하기
void onPressed_add() {

  setState(() {
    todos.add(input);
    input = ""; // 해당 코드를 사용함으로써 입력값이 바뀌지 않았을 때 공백으로 나오게 해준다.
  });
  Navigator.of(context).pop(); // 창이 닫히도록
}

}


class test extends _MyappState with PreferredSizeWidget {
  Widget _buildBody() {
    return Scaffold(
      body : ListView.builder( // builder를 사용한 이유는 리스트를 동적으로 생산하기 위함.
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(  // 상태를 가지는 위젯
            key: Key(todos[index]),
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                title: Text(todos[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      todos.removeAt(index);
                      }
                      );
                  },
                )
              )
            ),
          );
        },
      ),
    );
    
  }
  
  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
  
  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    // TODO: implement debugDescribeChildren
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement key
  Key? get key => throw UnimplementedError();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
  
  @override
  String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringDeep
    throw UnimplementedError();
  }
  
  @override
  String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringShallow
    throw UnimplementedError();
  }
}

