import 'package:flutter/material.dart';
import './styles/texts.dart';
import './styles/palette.dart';

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
    todos.add("더미 아이템");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: const Text(
          "Todo",
          style: appTitle, //texts.dart
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
                title: Text(
                  "Add Something!",
                  style: submitTitle,
                ),
                content: TextField(
                  cursorColor: Palette.primaryColor,
                  onChanged: (String value) {
                    input = value;
                  },
                  decoration: new InputDecoration(
                      hintText: "할 일을 추가해주세요",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.primaryColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.primaryColor))),
                ),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        todos.add(input);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "submit",
                        style: submitButton,
                      ))
                ],
              );
            },
          )
        },
        child: Icon(
          Icons.add,
          color: Palette.addIconColor,
          size: 45,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListTile(
                    title: Text(todos[index], style: itemName),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Palette.deleteIconColor),
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
}
