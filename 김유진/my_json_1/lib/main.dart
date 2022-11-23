import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        id: json["id"],
        title: json["title"],
        body: json["body"]);
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
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("JSON output"),
        ),
        body: Center(
          child: Column(
            children: [
              FutureBuilder<Post>(
                future: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Card(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        shadowColor: Colors.blueGrey,
                        elevation: 3,
                        child: Text(
                          snapshot.data!.title,
                          style: TextStyle(fontSize: 22),
                        ));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
//MARK: HTTP BASE RESPONSE
Future<http.Response> fetchPost() {
  return http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
}
*/

Future<Post> fetchPost() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

  if (response.statusCode == 200) {
    print("status:200, Success");
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Faild to loaded");
  }
}
