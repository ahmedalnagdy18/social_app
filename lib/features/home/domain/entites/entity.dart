class PostEntity {
  final String description;
  final String url;
  final String time;
  final String id;

  PostEntity(
      {required this.id,
      required this.description,
      required this.url,
      required this.time});
}

class StoryEntity {
  final String url;

  StoryEntity({required this.url});
}
