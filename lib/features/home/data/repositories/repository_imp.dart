import 'package:firebase_app/features/home/data/data_source/data_source.dart';
import 'package:firebase_app/features/home/data/model/api_model.dart';
import 'package:firebase_app/features/home/domain/repositories/repository.dart';

class PostRepositoryImpl implements PostRepository {
  final TimelineRemoteDataSource dataSource;

  PostRepositoryImpl({required this.dataSource});

  @override
  Stream<List<ApiPostModel>> getPosts() {
    return dataSource.getPostsData().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ApiPostModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
