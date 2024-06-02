class AddPost {
  final String description;
  final String? url;
  final DateTime time;
  final String? username;
  final String? ownerId;

  AddPost({
    required this.description,
    required this.url,
    required this.time,
    required this.username,
    required this.ownerId,
  });
}
