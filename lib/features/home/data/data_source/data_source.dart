import 'package:cloud_firestore/cloud_firestore.dart';

class TimelineRemoteDataSource {
  final CollectionReference _postsCollection =
      FirebaseFirestore.instance.collection("posts");
  final CollectionReference _storyCollection =
      FirebaseFirestore.instance.collection("Story");

  Stream<QuerySnapshot> getPostsData() {
    return _postsCollection.snapshots();
  }

  Stream<QuerySnapshot> getStoryData() {
    return _storyCollection.snapshots();
  }
}
