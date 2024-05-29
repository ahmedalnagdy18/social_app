class ApiPostModel {
  final String description;
  final String url;
  final String time;
  final String id;

  ApiPostModel(
      {required this.id,
      required this.description,
      required this.url,
      required this.time});

  factory ApiPostModel.fromFirestore(String id, Map<String, dynamic> data) {
    return ApiPostModel(
      description: data['description'] ?? '',
      url: data['url'] ?? '',
      time: data['time'] ?? '',
      id: id,
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
