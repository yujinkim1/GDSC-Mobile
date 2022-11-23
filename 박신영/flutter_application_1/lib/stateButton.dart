import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class stateButton extends StatefulWidget {
  @override
  State<stateButton> createState() => _stateButtonState();
}
// 우리가 보여줄 위젯을 createState에 넘겨주는 것

// 아래는 우리가 보여줄 위젯 리턴
class _stateButtonState extends State<stateButton> {
  int count = 0;  
  int secoundCount = 0;
                        //올라가는 수를 기록할 count와 2번째 버튼에 들어갈 
                        //(3번째 버튼의 2배의) 값을 저장할 secoundCount 변수 2개 선언
  
  @override
  Widget build(BuildContext context) {
    return Container(    
      alignment: Alignment.center,
      child: Column(      //container은 child를 한 개밖에 사용하지 못하기에 column으로 
                          //감싸 여러개의 버튼을 만들어 줄 수 있게 합니다.
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
        onPressed: () => {
          setState(() => { count += 1 },)
        },
        child: Text("button ${count}"),
      ),
      ElevatedButton(
        onPressed: () => {},
        child: Text("button ${secoundCount}"),
      ),
      ThirdButton(count, setDoubleCount)  //위에서 사용한 count를 받아 ThirdButton으로 넘긴이후
                                          // 아래 역시도 위와 같이 작동하도록 만들었기에 위젯끼리 연결.
                                          // 아래 ThirdButton에서 매개변수의 수를 바꿨기에 classButtonState에 
                                          //있는 ThirdButton 역시 2개를 받아야 합니다.
        ],
      ),
    );
  }
    void setDoubleCount() {
      setState(() {
        secoundCount = count * 2;
      });
    }
  
}

//? 아래는 stateless 상태인데 어떻게 변화하는가?
  //! ThirdButton의 매개변수?로 count를 써주었기에 앞서 바뀌어도 이 count가 들어와 변화하게 된다.

class ThirdButton extends StatelessWidget {
  const ThirdButton(this.count, this.setDoubleCount);
  
  final Function() setDoubleCount;
  final int count;
  @override  Widget build(BuildContext context) {

    return Container(
      child: ElevatedButton(
        onPressed: () => {
          setDoubleCount()
        },
        child: Text("button ${count}"),
      )
    );
  }
}