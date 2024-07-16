class Activity {
  final String id;
  final String title;
  final String description;
  final String downloadUrl;

  Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.downloadUrl,
  });

  Activity.fromJson(json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          downloadUrl: json['downloadUrl'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'downloadUrl': downloadUrl,
    };
  }
}