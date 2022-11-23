import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';

class statefulTest extends StatefulWidget {
  @override
  State<statefulTest> createState() => _statefulTestState();
}

class _statefulTestState extends State<statefulTest> {
  int cnt = 0;
  int doubleCnt = 0;
  void setDoubleCount() {
    setState(() {
      doubleCnt = cnt * 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cnt++;
                    });
                  },
                  child: Text('button ${cnt}')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('button ${doubleCnt}')),
              thirdButton(cnt, setDoubleCount)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cnt = 0;
            doubleCnt = 0;
          });
        },
        backgroundColor: Color.fromARGB(255, 128, 195, 249),
        child: Icon(Icons.restore),
      ),
    );
  }
}

class thirdButton extends StatelessWidget {
  const thirdButton(this.cnt, this.setDoubleCount);
  final int cnt;
  final Function() setDoubleCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            setDoubleCount();
          },
          child: Text('button ${cnt}')),
    );
  }
}
