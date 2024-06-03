import 'package:firebase_app/features/home/data/model/api_model.dart';

abstract class TimelineRepository {
  Stream<List<ApiPostModel>> getPosts();
  Stream<List<ApiStoryModel>> getStories();
  Future<void> likePost(String postId, String userId, bool likeStatus);
  Future<void> bookmark(String postId, String userId, bool bookmarkStatus);
}
