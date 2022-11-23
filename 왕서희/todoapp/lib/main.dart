// import 'package:flutter/material.dart';
// import 'package:todoapp/statelessTest.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('왕서희 어플'),
//           ),
//           body: Center(child: statelessTest())),
//     );
//   }
// }
import 'dart:html';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // 디버그 배너 없애기
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.brown,
        accentColor: Color.fromARGB(255, 195, 170, 132),
      ),
    ),
    home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> todos = [];
  String input = "";

  @override
  void initState() {
    // api 호출
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
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: Text("Add todolist"),
                      content: TextField(onChanged: (String value) {
                        input = value;
                      }),
                      actions: <Widget>[
                        TextButton(onPressed: addTextButton, child: Text("Add"))
                      ]);
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todos[index]),
                child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      title: Text(todos[index]),
                      trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.brown),
                          onPressed: () {
                            setState(() {
                              todos.removeAt(index);
                            });
                          }),
                    )));
          },
        ));
  }

  void addTextButton() {
    setState(() {
      todos.add(input);
      input = "";
    });
    Navigator.of(context).pop();
  }
}
