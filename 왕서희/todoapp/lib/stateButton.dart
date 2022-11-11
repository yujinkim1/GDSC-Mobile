import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class stateButton extends StatefulWidget {
  const stateButton({super.key});

  @override
  State<stateButton> createState() => _stateButtonState();
}

class _stateButtonState extends State<stateButton> {
  int count = 0;
  int secondCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () => {
                  setState(() => {count += 1})
                },
            child: Text('button ${count}')),
        ElevatedButton(
          onPressed: () => {},
          child: Text('button ${secondCount}'),
        ),
        ThirdButton(count, setDoubleCount)
      ]),
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
          onPressed: () => {setDoubleCount()}, child: Text('button ${count}')),
    );
  }
}
