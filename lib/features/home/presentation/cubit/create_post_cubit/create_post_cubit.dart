import 'dart:io';

import 'package:firebase_app/features/home/domain/entites/add_post_entity.dart';
import 'package:firebase_app/features/home/domain/usecases/create_post_usecase.dart';
import 'package:firebase_app/features/home/presentation/cubit/create_post_cubit/create_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends Cubit<CreatePostState> {
  final AddPostUseCase addPostUseCase;
  final UploadImageUseCase uploadImageUseCase;

  CreatePost({required this.addPostUseCase, required this.uploadImageUseCase})
      : super(PostInitial());

  Future<void> addPost(String description, File? file) async {
    try {
      emit(PostLoading());

      String? url;
      if (file != null) {
        url = await uploadImageUseCase.call(file);
      }

      final post = AddPost(
        description: description,
        url: url,
        time: DateTime.now(),
        username: null, // This will be set in the repository
        ownerId: null, // This will be set in the repository
      );

      await addPostUseCase.call(post);
      emit(PostSuccess());
    } catch (e) {
      emit(PostFailure(e.toString()));
    }
  }

  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        final file = File(image.path);
        emit(PostImagePicked(file));
      }
    } catch (e) {
      emit(PostFailure(e.toString()));
    }
  }
}
