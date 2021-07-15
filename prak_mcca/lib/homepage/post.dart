import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prak_mcca/database/database.dart';

class Post {
  String body;
  String author;
  Set userliked = {};
  DatabaseReference _id;

  Post(this.body, this.author);

  void likePost(FirebaseUser user) {
    if (this.userliked.contains(user.uid)) {
      this.userliked.remove(user.uid);
    } else {
      this.userliked.add(user.uid);
    }
    this.update();
  }

  void update() {
    updatePost(this, this._id);
  }

  void setID(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'author': this.author,
      'userLiked': this.userliked.toList(),
      'body': this.body
    };
  }

  static Post createPost(record) {
    Map<String, dynamic> attributes = {
      'author': '',
      'userLiked': [],
      'body': ''
    };

    record.forEach((key, value) => {attributes[key] = value});

    Post post = new Post(attributes['body'], attributes['author']);
    post.userliked = new Set.from(attributes['userLiked']);
    return post;
  }
}
