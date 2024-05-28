import 'package:firebase_app/features/home/data/model/api_model.dart';

abstract class PostRepository {
  Stream<List<ApiPostModel>> getPosts();
}
