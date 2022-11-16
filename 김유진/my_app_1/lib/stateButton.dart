import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class stateButton extends StatefulWidget {
  @override
  State<stateButton> createState() => _stateButtonState();
}

class _stateButtonState extends State<stateButton> {
  int value = 0;
  int multiValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () => {
                  setState(() => {value += 1})
                },
            child:
                Text("pressed ${value} times", style: TextStyle(fontSize: 20))),
        ElevatedButton(
            onPressed: () => {
                  setState((() => {setDoubleValue()}))
                },
            child:
                Text("${multiValue} multiply", style: TextStyle(fontSize: 20))),
        PressButton(value, setDoubleValue),
        ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text("Do you want a reset?"),
              action: SnackBarAction(
                onPressed: () => {
                  setState(() => {value = 0, multiValue = 0})
                },
                label: 'Yes',
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text("reset", style: TextStyle(fontSize: 20)),
        )
      ],
    );
  }

  void setDoubleValue() {
    setState(() {
      multiValue = value * 2;
    });
  }
}

class PressButton extends StatelessWidget {
  int value = 0;
  PressButton(this.value, this.setDoubleValue);
  final Function() setDoubleValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () => {setDoubleValue()},
          child: Text(
            "${value}",
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
