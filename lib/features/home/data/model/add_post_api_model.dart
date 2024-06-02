class AddPostModel {
  final String description;
  final String? url;
  final String time;
  final String? username;
  final String? ownerId;

  AddPostModel({
    required this.description,
    required this.url,
    required this.time,
    required this.username,
    required this.ownerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'url': url ?? "none",
      'time': time,
      'username': username,
      'ownerId': ownerId,
    };
  }
}
