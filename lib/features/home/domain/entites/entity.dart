class PostEntity {
  final String id;
  final String description;
  final String url;
  final String time;
  final String username;
  final List<String> like;
  final int likeCount;

  PostEntity({
    required this.username,
    required this.id,
    required this.description,
    required this.url,
    required this.time,
    required this.like,
    required this.likeCount,
  });
}

class StoryEntity {
  final String url;

  StoryEntity({required this.url});
}
