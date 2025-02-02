import 'package:firebase_database/firebase_database.dart';
import 'package:prak_mcca/homepage/post.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference savePost(Post post) {
  var id = databaseReference.child('post/').push();
  id.set(post.toJson());
  return id;
}

void updatePost(Post post, DatabaseReference id) {
  id.update(post.toJson());
}

Future<List<Post>> getAllPosts() async {
  DataSnapshot dataSnapshot = await databaseReference.child('post/').once();
  List<Post> posts = [];
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Post post = Post.createPost(value);
      post.setID(databaseReference.child('post/' + key));
      posts.add(post);
    });
  }
  return posts;
}
