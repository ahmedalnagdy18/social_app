class ApiPostModel {
  final String id;
  final String description;
  final String url;
  final String time;
  final String username;
  final bool like;

  ApiPostModel({
    required this.username,
    required this.id,
    required this.description,
    required this.url,
    required this.time,
    required this.like,
  });

  factory ApiPostModel.fromFirestore(String id, Map<String, dynamic> data) {
    return ApiPostModel(
      id: id,
      username: data['username'] ?? '',
      description: data['description'] ?? '',
      url: data['url'] ?? '',
      time: data['time'] ?? '',
      like: data['like'] ?? false,
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
