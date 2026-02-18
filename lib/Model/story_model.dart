class StatusUser {
  final String name;
  final String imageUrl;
  final bool hasUnseenStory;

  StatusUser({
    required this.name,
    required this.imageUrl,
    this.hasUnseenStory = false,
  });
}
