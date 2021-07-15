import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prak_mcca/database/database.dart';
import 'package:prak_mcca/homepage/post.dart';
import 'package:prak_mcca/homepage/postList.dart';
import 'package:prak_mcca/homepage/textInput.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;
  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// ignore: camel_case_types
class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    savePost(post);
    post.setID(savePost(post));
    this.setState(() {
      posts.add(post);
    });
  }

  void updatePost() {
    getAllPosts().then((posts) => {
          this.setState(() {
            this.posts = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updatePost();
  }

  getuser() {
    if (widget.user.isAnonymous == true) {
      return "Anonymous";
    } else {
      return widget.user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Homepage"),
          shadowColor: Colors.red,
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: PostList(this.posts, widget.user)),
            TextInputWidget(this.newPost)
          ],
        ));
  }
}
