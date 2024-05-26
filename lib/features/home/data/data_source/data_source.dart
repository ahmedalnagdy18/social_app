import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataSource {
  Stream<QuerySnapshot> getPostsData() {
    CollectionReference posts = FirebaseFirestore.instance.collection("posts");
    Stream<QuerySnapshot> taskstype = posts.snapshots();
    return taskstype;
  }

  Stream<QuerySnapshot> getStoryData() {
    CollectionReference story = FirebaseFirestore.instance.collection("Story");
    Stream<QuerySnapshot> taskstype = story.snapshots();
    return taskstype;
  }
}
