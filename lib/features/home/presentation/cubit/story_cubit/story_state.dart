// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'story_cubit.dart';

abstract class StoryState {}

final class TimelineInitial extends StoryState {}

class LoadingAllStories extends StoryState {}

class SuccessAllStories extends StoryState {
  final List<StoryEntity> stories;
  SuccessAllStories({
    required this.stories,
  });
}

class FailStories extends StoryState {}
