import 'package:firebase_app/features/home/data/model/api_model.dart';
import 'package:firebase_app/features/home/domain/repositories/repository.dart';

class GetPostsUseCase {
  final TimelineRepository repository;

  GetPostsUseCase({required this.repository});

  Stream<List<ApiPostModel>> call() {
    return repository.getPosts();
  }
}

class LikePostUseCase {
  final TimelineRepository repository;

  LikePostUseCase({required this.repository});

  Future<void> call(String postId, String userId, bool like) {
    return repository.likePost(postId, userId, like);
  }
}

class BookmarkPostUseCase {
  final TimelineRepository repository;

  BookmarkPostUseCase({required this.repository});

  Future<void> call(String postId, String userId, bool bookmark) {
    return repository.bookmark(postId, userId, bookmark);
  }
}
