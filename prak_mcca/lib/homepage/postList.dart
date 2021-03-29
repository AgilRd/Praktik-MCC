import 'package:flutter/material.dart';
import 'post.dart';

class PostList extends StatefulWidget {
  final List<Post> listitems;

  PostList(this.listitems);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void likeUpdate(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listitems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listitems[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: Text(post.body),
                subtitle: Text(post.author),
              )),
              Row(children: <Widget>[
                Container(
                  child: Text(post.likePost.toString(),
                      style: TextStyle(fontSize: 10)),
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () => this.likeUpdate(post.likePost),
                  color: post.userLiked ? Colors.red : Colors.black,
                )
              ])
            ],
          ),
        );
      },
    );
  }
}