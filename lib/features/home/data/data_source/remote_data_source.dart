import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/home/data/data_source/data_source.dart';

abstract class RemoteDataSource {
  Stream<QuerySnapshot> getPosts();
  Stream<QuerySnapshot> getStory();
}

class TimelineRemoteDataSource extends RemoteDataSource {
  FirebaseDataSource dataSource;
  TimelineRemoteDataSource({required this.dataSource});

  @override
  Stream<QuerySnapshot> getPosts() {
    Stream<QuerySnapshot> posts = dataSource.getPostsData();

    return posts;
  }

  @override
  Stream<QuerySnapshot> getStory() {
    Stream<QuerySnapshot> story = dataSource.getStoryData();

    return story;
  }
}
