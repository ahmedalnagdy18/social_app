import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/home/data/model/api_model.dart';

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

  Future<Stream<QuerySnapshot<Object?>>> fetchPosts() async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/posts?skip=$skip&limit=$limit'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      Future<Stream<QuerySnapshot<Object?>>> posts = [];
      for (var element in data['posts']) {
        posts.add(ApiModel.fromJson(element));
      }
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
