import 'package:firebase_app/features/home/data/model/api_model.dart';
import 'package:firebase_app/features/home/domain/repositories/repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase({required this.repository});

  Stream<List<ApiPostModel>> call() {
    return repository.getPosts();
  }
}
