import 'package:flutter/material.dart';
// import 'package:flutter_01/stateButton.dart';
// import 'package:flutter_01/statelessTest.dart';

// 11/9 스터디
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             // 맨위에 있는 바
//             title: const Text('박진희 어플'),
//           ),
//           body: stateButton()),
//     );
//   }
// }

// 11/16 스터디 - todoapp

void main() => runApp(MaterialApp(
      //MaterialApp은 Material Design을 사용할 수 있게 해주는 class
      debugShowCheckedModeBanner: false, // 디버그 배너 없애기
      theme: ThemeData(
          brightness: Brightness.light, // 다크 모드 설정 -> dark
          primarySwatch: Colors.green, //primaryColor 이 안된다면 primarySwatch
          accentColor: Color.fromARGB(255, 232, 198, 46)),
      home: MyApp(),
    ));

// 위 ThemeDate는 이제 지원하지 않음. 아래처럼 바꿔서 사용할 수 있음.
// void main() => runApp(MaterialApp(
//     debugShowCheckedModeBanner: false, // 디버그 배너 없애기
//     theme: ThemeData(
//       colorScheme: ColorScheme.fromSwatch(
//         brightness: Brightness.dark,
//         accentColor: Colors.orange,
//       ),
//     ),
//     home: MyApp()
// ));

class MyApp extends StatefulWidget {
  // StatefulWidget을 상속받는 MyApp 클래스 생성
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // State<MyApp>을 상속받는 _MyAppState private 클래스 생성
  List<String> todos = []; // 리스트 선언
  String input = ""; // 리스트의 제목(할 일을 적을) String 선언

  @override
  void initState() {
    // 기본적으로 있을 리스트 정보들
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
    todos.add("Item3");
    todos.add("Item4");
  }

  @override
  Widget build(BuildContext context) {
    // 기본적인 material design의 시각적인 레이아웃 구조를 실행
    // material design은 구글식 디자인 컨셉(?)
    return Scaffold(
      // Scaffold는 appBar와 body라는 옵션을 가진다.

      appBar: AppBar(
        title: Text("TodoApp"),
      ),
      floatingActionButton: FloatingActionButton(
        // 하단의 플러스 모양 버튼
        onPressed: () {
          // 눌렀을 때
          showDialog(
              // Dialog창을 보인다.
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("Add Todolist"),
                    content: TextField(
                      onChanged: (String value) {
                        input = value; // 직접 작성하게 되는 string으로 설정
                      },
                    ),
                    actions: <Widget>[
                      // 액션은 위젯으로!
                      addButton(setAdd) // 버튼 클래스 만들었음
                      // TextButton(
                      //     // 텍스트 버튼으로 사용된다.
                      //     onPressed: () {
                      //       setState(() {
                      //         todos.add(input);
                      //       });
                      //       Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                      //     },
                      //     child: Text("Add"))
                    ]);
              });
        },
        child: Icon(
          // 색상 설정하기
          // + 색상
          Icons.add,
          color: Colors.white,
        ),
      ),

      // body 부분
      body: ListView.builder(
          // ListView에 사용할 List를 정해두고, itemBuilder를 사용하여
          //item을 itemcount에 맞춰서 ListView를 구성하기만 하면 됩니다.
          //ListView.builder를 사용하는 이유는 화면에 보여지는 리스트들 그때그때 마다 호출하기 위해 사용합니다.
          //보이는 부분만 불러오기 때문에 ListView보다 효율적으로 화면을 구성할 수 있습니다.
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                // List에서 특정 아이템을 좌,우로 움직였을 때, 특정 action을 취하고 아이템이 사라지도록하는 widget
                // 삭제 버튼 및 기능 추가
                key: Key(todos[index]),
                child: Card(
                    elevation: 4, // 그림자의 깊이를 설정
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        // 모서리 둥글게!
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      // Flutter에서의 ListView는 ListTile들로 구성 -> 우리는 item을 4개 넣었으니 4개
                      title: Text(todos[index]), // 우리가 작성한 item1~4이고,
                      trailing:
                          //DeleteButton(index, setDelete)
                          IconButton(
                              // 끝부분에 삭제하는 아이콘 설정
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // 눌렀을 때 삭제되게!
                                setState(() {
                                  todos.removeAt(index);
                                });
                              }),
                    )));
          }),
    );
  }

  void setAdd() {
    setState(() {
      todos.add(input);
    });
  }

  // void setDelete() {
  //   setState(() {
  //     todos.removeAt(index);
  //   });
  // }
}

// 삭제 버튼
// class DeleteButton extends StatelessWidget {
//   const DeleteButton(this.index, this.setDelete);

//   final Function() setDelete;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: IconButton(
//         icon: Icon(Icons.delete, color: Colors.red),
//         onPressed: () => {setDelete()},
//       ),
//     );
//   }
// }

// add Dialog창 안에 있는 add 버튼
class addButton extends StatelessWidget {
  const addButton(this.setAdd);

  final Function() setAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () => {setAdd(), Navigator.of(context).pop()},
        child: Text("Add"),
      ),
    );
  }
}
