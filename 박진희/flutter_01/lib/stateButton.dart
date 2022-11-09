import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class stateButton extends StatefulWidget {
  // const stateButton({super.key});

  @override
  State<stateButton> createState() => _stateButtonState();
}

class _stateButtonState extends State<stateButton> {
  int count = 0;
  int secondCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center, // 버튼 위치
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {
                // 클릭되면
                setState(() => {count += 1})
              },
              child: Text('button ${count}'),
            ),
            ElevatedButton(
              onPressed: () => {},
              child: Text('button ${secondCount}'),
            ),
            ThirdButton(count, setDoubleCount)
          ],
        ));
  }

  void setDoubleCount() {
    setState(() {
      secondCount = count * 2;
    });
  }
}

class ThirdButton extends StatelessWidget {
  const ThirdButton(this.count, this.setDoubleCount); // 생성자

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
