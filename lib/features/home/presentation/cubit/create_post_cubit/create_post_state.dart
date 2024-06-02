import 'dart:io';

abstract class CreatePostState {}

class PostInitial extends CreatePostState {}

class PostLoading extends CreatePostState {}

class PostSuccess extends CreatePostState {}

class PostFailure extends CreatePostState {
  final String error;
  PostFailure(this.error);
}

class PostImagePicked extends CreatePostState {
  final File file;
  PostImagePicked(this.file);
}
