// import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:todolist/stateButton.dart';
// import 'package:todolist/statelessTest.dart';

// void main() {
//   runApp(MyApp());
// }

// // This widget is the root of your application.
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('김은총 어플'),
//         ),
//         body: stateButton()
//       ),
//     );
//   }
// }




void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false,  //화면위쪽 디버그 표시 없앰
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light, //dark/light 모드 설정
    primarySwatch: Colors.green, //primaryColor 아니면 primarySwatch
    accentColor: Colors.purple),
  ),
  home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

//액션 넣기(항목 추가, 삭제 등)
class _MyAppState extends State<MyApp> {
  List<String> todos = [];
  String input = "";

  @override
  // initState의 역할: State를 초기화(API로 호출 등)
  void initState() {
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
      title: Text("todoapp"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showDialog = 모바일의 화면전환 (이전값 기억)
          showDialog(
            context: context, 
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Add todolist"),
                content: TextField(onChanged: (String value) {
                    input = value;
                  }),

                actions: <Widget> [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        todos.add(input);
                        // q.공백을 넣으면 왜 이전값이 입력될까?
                        // a. TesxtField에 onChanged가 있기 때문. 아래처럼 input값을 지정해주면 된다.
                        input = "";
                      });
                      Navigator.of(context).pop(); //창닫기
                    },
                    child: Text("Add"),)
                ]
              );
            }
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      // 아이템 쌓기 stateful 위젯
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todos[index]),
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),

              child: ListTile(
                title: Text(todos[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.green),
                  onPressed: () {
                    setState(() {
                      todos.removeAt(index);
                    });
                  },),
              ),
            ));
        }),
    );
  }
}





      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      // ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),


// class statelessTest extends StatelessWidget {
//   List<String> names = ['bbobby', 'bbibbo', 'apple', 'banana'];

//   @override
//   Widget build(BuildContext context) {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         for (String i in names) DogName(i)
//       ],
//     ),
//   }

// class DogName extends StatelessWidget {
//   final String name;

//   const DogName(this.name);

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(color: Colors.lightBlue),
//       child: Padding(padding: EdgeInsets.all(8.0), child: Text(name)),
//     );
//   }
// }


////


//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
