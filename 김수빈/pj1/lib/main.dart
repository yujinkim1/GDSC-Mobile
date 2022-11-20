import 'package:flutter/material.dart';
// import 'package:todolist/stateButton.dart';
// import 'package:todolist/statelessTest.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          //primarySwatch: Colors.blue, //primaryColor or primarySwatch
          accentColor: Color(0xFFD0BCF2)),
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
        backgroundColor: Color(0xFFD0BCF2),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressedFloatingActionButton,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      //body

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
                      icon: Icon(Icons.delete, color: Color(0xFFD0BCF2)),
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    ),
                  ),
                ));
          }),
    );
  }

  //FloatingAction버튼 눌렀을 때 메소드
  void onPressedFloatingActionButton() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Add todoList"),
              content: TextField(onChanged: (String value) {
                input = value;
              }),
              actions: <Widget>[
                TextButton(onPressed: onPressedTextButton, child: Text("Add"))
              ]);
        });
  }

  //텍스트 버튼 눌렀을 때 메소드
  void onPressedTextButton() {
    setState(() {
      todos.add(input);
    });
    Navigator.of(context).pop();
  }
}


/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("김수빈 어플"),
          ),
          body: statefulTest()),
    );
  }
}*/

