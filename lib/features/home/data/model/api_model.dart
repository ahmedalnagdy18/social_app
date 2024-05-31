class ApiPostModel {
  final String id;
  final String description;
  final String url;
  final String time;
  final String username;
  final List<String> like;
  final int likeCount;

  ApiPostModel({
    required this.username,
    required this.id,
    required this.description,
    required this.url,
    required this.time,
    required this.like,
    required this.likeCount,
  });

  factory ApiPostModel.fromFirestore(String id, Map<String, dynamic> data) {
    return ApiPostModel(
      id: id,
      username: data['username'] ?? '',
      description: data['description'] ?? '',
      url: data['url'] ?? '',
      time: data['time'] ?? '',
      like: List<String>.from(data['likes'] ?? []),
      likeCount: data['likeCount'] ?? 0,
    );
  }
}

class ApiStoryModel {
  final String url;

  ApiStoryModel({required this.url});

  factory ApiStoryModel.fromFirestore(Map<String, dynamic> data) {
    return ApiStoryModel(
      url: data['url'] ?? '',
    );
  }
}
