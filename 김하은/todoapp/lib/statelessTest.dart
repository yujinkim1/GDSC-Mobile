// import 'package:flutter/material.dart';

// class statelessTest extends StatelessWidget {
//   List<String> names = ['bbobby', 'bbibbo', 'apple', 'banana'];

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           for (String i in names)
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: DogName(i),
//             )
//         ],
//       ),
//     );
//   }
// }

// class DogName extends StatelessWidget {
//   final String name;

//   const DogName(this.name);

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(color: Colors.lightBlue),
//       child: Padding(padding: EdgeInsets.all(8.0), child: Text(name)),
//     );
//   }
// }
