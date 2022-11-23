import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class statefulTest extends StatefulWidget {
  @override
  State<statefulTest> createState() => _statefulTestState();
}

class _statefulTestState extends State<statefulTest> {
  int count = 0;
  int secondCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => {},
            child: Text('button ${secondCount}'),
          ),
          ElevatedButton(
            onPressed: () => {
              setState(() => {count += 1})
            },
            child: Text('button ${count}'),
          ),
          /*ElevatedButton(
            onPressed: () => {},
            child: Text('button ${secondCount}'),
          ),*/
          ThirdButton(count, setDoubleCount)
        ],
      ),
    );
  }

  void setDoubleCount() {
    setState(() {
      secondCount = count * 2;
    });
  }
}

class ThirdButton extends StatelessWidget {
  const ThirdButton(this.count, this.setDoubleCount);

  final Function() setDoubleCount;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => {setDoubleCount()},
        child: Text('button ${count}'),
      ),
    );
  }
}
/*class IndexCard extends StatelessWidget {
  const IndexCard(this.todos, this.index);

  final int index;
  final List<String> todos;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(todos[index]),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Color(0xFFD0BCF2)),
          onPressed: () {
            //setState(() {
            todos.removeAt(index); //눌렀을 때 삭제
            //});
          },
        ),
      ),
    ));
  }*/

  /*void onPressedIconButton(){
    setState(() {
      todos.removeAt(index); //눌렀을 때 삭제
    });
  }
}*/
