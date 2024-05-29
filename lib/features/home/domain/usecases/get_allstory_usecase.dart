import 'package:firebase_app/features/home/data/model/api_model.dart';
import 'package:firebase_app/features/home/domain/repositories/repository.dart';

class GetStoriesUseCase {
  final TimelineRepository repository;

  GetStoriesUseCase({required this.repository});

  Stream<List<ApiStoryModel>> call() {
    return repository.getStories();
  }
}
