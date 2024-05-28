class ApiPostModel {
  final String description;
  final String url;
  final String time;

  ApiPostModel(
      {required this.description, required this.url, required this.time});

  factory ApiPostModel.fromFirestore(Map<String, dynamic> data) {
    return ApiPostModel(
      description: data['description'] ?? '',
      url: data['url'] ?? '',
      time: data['time'] ?? '',
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
