import 'package:bloc/bloc.dart';
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
                    url: doc.url,
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
}
