import 'dart:io';

import 'package:firebase_app/features/home/domain/entites/add_post_entity.dart';
import 'package:firebase_app/features/home/domain/repositories/add_post_repo.dart';

class AddPostUseCase {
  final CreatePostRepository repository;

  AddPostUseCase({required this.repository});

  Future<void> call(AddPost post) {
    return repository.addPost(post);
  }
}

class UploadImageUseCase {
  final CreatePostRepository repository;

  UploadImageUseCase({required this.repository});

  Future<String?> call(File file) {
    return repository.uploadImage(file);
  }
}
