import 'package:bloc/bloc.dart';
import 'package:firebase_app/features/home/domain/entites/entity.dart';
import 'package:firebase_app/features/home/domain/services/totask.dart';
import 'package:firebase_app/features/home/domain/usecases/get_allposts_usecase.dart';
import 'package:firebase_app/features/home/domain/usecases/get_allstory_usecase.dart';

part 'timeline_state.dart';

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit(
      {required this.getAllPostsUsecase, required this.getAllStoriesUsecase})
      : super(TimelineInitial());
  final GetAllPostsUsecase getAllPostsUsecase;
  final GetAllStoriesUsecase getAllStoriesUsecase;

  getAllPosts() async {
    try {
      List<Entity> posts = [];
      emit(LoadingAllPosts());
      var data = await getAllPostsUsecase.call();
      data.listen((event) {
        posts = totask(event.docs);

        emit(SuccessAllPosts(posts: posts));
      });
    } on Exception {
      emit(FailPosts());
    }
  }

  getAllStories() async {
    try {
      List<Entity> stories = [];
      emit(LoadingAllStories());
      var data = await getAllStoriesUsecase.call();
      data.listen((event) {
        stories = totask(event.docs);
        emit(SuccessAllStories(stories: stories));
      });
    } on Exception {
      emit(FailStories());
    }
  }
}
