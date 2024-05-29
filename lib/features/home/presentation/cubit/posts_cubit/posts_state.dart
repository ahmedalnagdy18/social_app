// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_cubit.dart';

abstract class PostsState {}

final class TimelineInitial extends PostsState {}

class LoadingAllPosts extends PostsState {}

class SuccessAllPosts extends PostsState {
  List<PostEntity> posts;
  SuccessAllPosts({
    required this.posts,
  });
}

class FailPosts extends PostsState {}
