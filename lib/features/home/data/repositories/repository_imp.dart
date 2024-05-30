import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/home/data/data_source/data_source.dart';
import 'package:firebase_app/features/home/data/model/api_model.dart';
import 'package:firebase_app/features/home/domain/repositories/repository.dart';

class TimelineRepositoryImpl implements TimelineRepository {
  final TimelineRemoteDataSource dataSource;

  TimelineRepositoryImpl({required this.dataSource});

  @override
  Stream<List<ApiPostModel>> getPosts() {
    return dataSource.getPostsData().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ApiPostModel.fromFirestore(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  @override
  Stream<List<ApiStoryModel>> getStories() {
    return dataSource.getStoryData().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ApiStoryModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  @override
  Future<void> likePost(String postId, bool like) async {
    final postRef = FirebaseFirestore.instance.collection('posts').doc(postId);
    final postSnapshot = await postRef.get();
    final currentLikeCount = postSnapshot.data()?['likeCount'] ?? 0;

    if (like) {
      await postRef.update({'like': true, 'likeCount': currentLikeCount + 1});
    } else {
      await postRef.update({'like': false, 'likeCount': currentLikeCount - 1});
    }
  }
}
