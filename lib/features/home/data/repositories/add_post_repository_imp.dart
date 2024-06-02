import 'dart:io';

import 'package:firebase_app/features/home/data/data_source/add_post_data_source.dart';
import 'package:firebase_app/features/home/data/model/add_post_api_model.dart';
import 'package:firebase_app/features/home/domain/entites/add_post_entity.dart';
import 'package:firebase_app/features/home/domain/repositories/add_post_repo.dart';
import 'package:intl/intl.dart';

class CreatePostRepositoryImpl implements CreatePostRepository {
  final FirebasePostDataSource dataSource;

  CreatePostRepositoryImpl({required this.dataSource});

  @override
  Future<void> addPost(AddPost post) async {
    final user = dataSource.auth.currentUser;
    final postModel = AddPostModel(
      description: post.description,
      url: post.url,
      time: DateFormat('d MMMM, hh:mm a').format(post.time),
      username: user?.email,
      ownerId: user?.uid,
    );

    await dataSource.addPost(postModel.toMap());
  }

  @override
  Future<String?> uploadImage(File file) async {
    return await dataSource.uploadImage(file);
  }
}
