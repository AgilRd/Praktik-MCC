import 'package:flutter/material.dart';
import 'package:prak_mcca/homepage/post.dart';
import 'package:prak_mcca/homepage/postList.dart';
import 'package:prak_mcca/homepage/textInput.dart';
import 'package:prak_mcca/login/login2.dart';
class MyHomePage extends StatefulWidget {
  final String name;
  MyHomePage(this.name);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// ignore: camel_case_types
class _MyHomePageState extends State<MyHomePage> {
  List<Post> post = [];

  void newPost(String text) {
    this.setState(() {
      post.add(new Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Hello WOrld!"),
        shadowColor: Colors.greenAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: PostList(this.post)),
          TextInputWidget(this.newPost)
        ],
      ),
    );
  }
}
