import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/home/domain/entites/entity.dart';
import 'package:firebase_app/features/home/domain/usecases/get_allstory_usecase.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit({
    required this.getStoriesUseCase,
  }) : super(TimelineInitial());
  final GetStoriesUseCase getStoriesUseCase;

  void getStory() async {
    emit(LoadingAllStories());
    try {
      final storyStream = getStoriesUseCase.call();
      storyStream.listen(
        (postSnapshots) {
          final stories = postSnapshots
              .map((doc) => StoryEntity(
                    id: doc.id,
                    url: doc.url,
                    username: doc.username,
                    ownerId: doc.ownerId,
                  ))
              .toList();
          emit(SuccessAllStories(stories: stories));
        },
        onError: (error) {
          emit(FailStories());
        },
      );
    } catch (e) {
      emit(FailStories());
    }
  }

  delStory(String id) async {
    try {
      await FirebaseFirestore.instance.collection("Story").doc(id).delete();
    } on Exception {
      emit(FailDell());
    }
  }
}
