import 'package:flutter/material.dart';
<<<<<<< HEAD

class Palette {
  static const primaryColor = Color(0xff5b89fc);
}
=======
import './stateButton.dart';
import './less.dart';
>>>>>>> refs/remotes/origin/main

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
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
<<<<<<< HEAD
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: const Text(
          "Todo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        centerTitle: false,
        toolbarHeight: 100,
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Palette.primaryColor,
        onPressed: () => {
          //Pressed Something action
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Add Something!"),
                content: TextField(
                  autocorrect: mounted,
                  onChanged: (String value) {
                    input = value;
                  },
                ),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        todos.add(input);
                        Navigator.of(context).pop();
                      },
                      child: Text("submit"))
                ],
              );
            },
          )
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 45,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: ListTile(
                    title: Text(todos[index],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff2b2b2b))),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Color(0xffbbbbbbb)),
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
=======
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              centerTitle: false,
              title: const Text(
                "Labels",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            body: Center(child: stateButton())));
>>>>>>> refs/remotes/origin/main
  }
}
