import 'dart:convert';

class Reddit {
  String title;
  String thumbnail;
  Reddit({
    required this.title,
    required this.thumbnail,
  });

  Reddit copyWith({
    String? title,
    String? thumbnail,
  }) {
    return Reddit(
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'thumbnail': thumbnail,
    };
  }

  factory Reddit.fromMap(Map<String, dynamic> map) {
    return Reddit(
      title: map['title'],
      thumbnail: map['thumbnail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Reddit.fromJson(String source) => Reddit.fromMap(json.decode(source));

  @override
  String toString() => 'Reddit(title: $title, thumbnail: $thumbnail)';
}
