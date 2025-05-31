import 'dart:convert';

class Article {
  String id;
  String title;
  String description;
  // final String imageUrl;
  String userId;
  String createdAt;

  Article({
    required this.id,
    required this.title,
    required this.description,
    // required this.imageUrl,
    required this.userId,
    required this.createdAt,
  });

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      // 'imageUrl': imageUrl,
      'userId': userId,
      'createdAt': createdAt,
    };
  }

  factory Article.fromjson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      // imageUrl: map['imageUrl'],
      userId: json['userId'],
      createdAt: json['createdAt'],
    );
  }
}
