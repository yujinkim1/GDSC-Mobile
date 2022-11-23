import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      { // 생성자
      required this.userId,
      required this.id,
      required this.title,
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var post = fetchPost(); // 화면이 build할 때마다 호출
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("API Test"),
          ),
          body: FutureBuilder<Post>(
            // 데이터 가져옴
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data!.title,
                  style: TextStyle(fontSize: 40),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}

Future<Post> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    print('성공!');
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed API');
  }
}
