import 'dart:io';

import 'package:firebase_app/features/home/domain/entites/add_post_entity.dart';

abstract class CreatePostRepository {
  Future<void> addPost(AddPost post);
  Future<String?> uploadImage(File file);
}
