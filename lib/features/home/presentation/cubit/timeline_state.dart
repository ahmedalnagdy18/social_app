// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'timeline_cubit.dart';

abstract class TimelineState {}

final class TimelineInitial extends TimelineState {}

class LoadingAllPosts extends TimelineState {}

class SuccessAllPosts extends TimelineState {
  List<Entity> posts;
  SuccessAllPosts({
    required this.posts,
  });
}

class FailPosts extends TimelineState {}

class LoadingAllStories extends TimelineState {}

class SuccessAllStories extends TimelineState {
  List<Entity> stories;
  SuccessAllStories({
    required this.stories,
  });
}

class FailStories extends TimelineState {}
