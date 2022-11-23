import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var post = fetchPost();
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Json Example'),
          ),
          body: Center(
              child: post == null
                  ? Text('실패')
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('fetchPost 성공', style: TextStyle(fontSize: 30)),
                        FutureBuilder<Post>(
                            future: post,
                            builder: ((context, snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text('userId : ${snapshot.data!.userId}'),
                                      Text('ID : ${snapshot.data!.id}'),
                                      Text('Title : ${snapshot.data!.title}'),
                                      Text('Body : ${snapshot.data!.body}'),
                                    ],
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return CircularProgressIndicator();
                            }))
                      ],
                    )),
        ));
  }
}

Future<Post> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  if (response.statusCode == 200) {
    print('Good');
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('throw Exception');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json["userId"],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
