// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_app/features/home/data/data_source/remote_data_source.dart';
import 'package:firebase_app/features/home/domain/repositories/repository.dart';

class RepositoryImp extends Repository {
  TimelineRemoteDataSource dataSource;
  RepositoryImp({
    required this.dataSource,
  });
  @override
  Stream<QuerySnapshot<Object?>> getAllPost() {
    try {
      Stream<QuerySnapshot> data = dataSource.getPosts();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> getAllSory() {
    try {
      Stream<QuerySnapshot> data = dataSource.getStory();
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
