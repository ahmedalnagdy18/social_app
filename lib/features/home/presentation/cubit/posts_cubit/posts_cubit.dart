import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/home/domain/entites/entity.dart';
import 'package:firebase_app/features/home/domain/usecases/get_allposts_usecase.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({
    required this.getAllPostsUsecase,
  }) : super(TimelineInitial());
  final GetPostsUseCase getAllPostsUsecase;
  void getAllPosts() async {
    emit(LoadingAllPosts());
    try {
      final postsStream = getAllPostsUsecase.call();
      postsStream.listen(
        (postSnapshots) {
          final posts = postSnapshots
              .map((doc) => PostEntity(
                    description: doc.description,
                    url: doc.url,
                    time: doc.time,
                    id: doc.id,
                  ))
              .toList();
          emit(SuccessAllPosts(posts: posts));
        },
        onError: (error) {
          emit(FailPosts());
        },
      );
    } catch (e) {
      emit(FailPosts());
    }
  }

  delPost(String id) async {
    try {
      await FirebaseFirestore.instance.collection("posts").doc(id).delete();
    } on Exception {
      emit(FailDell());
    }
  }
}