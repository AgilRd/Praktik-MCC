import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

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
}

