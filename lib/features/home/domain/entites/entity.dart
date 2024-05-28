class PostEntity {
  final String description;
  final String url;
  final String time;

  PostEntity(
      {required this.description, required this.url, required this.time});
}

class StoryEntity {
  final String url;

  StoryEntity({required this.url});
}
