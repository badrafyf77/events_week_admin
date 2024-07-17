class Gallery {
  final String id;
  final String title;
  final String downloadUrl;

  Gallery({
    required this.id,
    required this.title,
    required this.downloadUrl,
  });

  Gallery.fromJson(json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          downloadUrl: json['downloadUrl'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'downloadUrl': downloadUrl,
    };
  }
}