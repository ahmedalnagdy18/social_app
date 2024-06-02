class ApiPostModel {
  final String id;
  final String description;
  final String url;
  final String time;
  final String username;
  final List<String> like;
  final int likeCount;
  final String ownerId;

  ApiPostModel({
    required this.username,
    required this.id,
    required this.description,
    required this.url,
    required this.time,
    required this.like,
    required this.likeCount,
    required this.ownerId,
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
      ownerId: data['ownerId'] ?? '', // Parse ownerId
    );
  }
}

class ApiStoryModel {
  final String id;
  final String url;
  final String username;
  final String ownerId;

  ApiStoryModel({
    required this.id,
    required this.url,
    required this.username,
    required this.ownerId,
  });

  factory ApiStoryModel.fromFirestore(String id, Map<String, dynamic> data) {
    return ApiStoryModel(
      id: id,
      url: data['url'] ?? '',
      username: data['username'] ?? '',
      ownerId: data['ownerId'] ?? '',
    );
  }
}
