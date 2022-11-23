import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.title,
      required this.id,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var post = fetchPost();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("API TEST"),
          ),
          body: FutureBuilder<Post>(
              future: post,
              builder: (context, snapshot) {
                //snapshot은 받은 데이터가 들어있음
                print(snapshot.data);
                if (snapshot.data != null) {
                  return Text(
                    snapshot.data!.title, // !를 사용한 것은 앞서 if문에서 hasdata라고 칭하였기에 이미 값을 가지고 있다고 가정한 이후의 일이기에 
                    style: TextStyle(fontSize: 40),
                  ); //
                }
                else if (snapshot.hasError) {
                  throw Exception(snapshot.error);
                }
                return CircularProgressIndicator();
              }),
        ));
  }
}

Future<Post> fetchPost() async {
  
  // async 비동기 얘는 병렬로 진행 따라서 아래 await를 써줌으로써 그 뒤에 문장의 코딩이 끝날 때까지 병렬진행을 멈추고 기다리게 한다.
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body)); // body가 받은 string을 json으로 바꿔서 fromjosn에다가 넘겨줌
  } else {
    throw Exception('Failed API');
  }
}
