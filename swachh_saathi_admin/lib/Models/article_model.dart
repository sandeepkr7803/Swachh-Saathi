class Article {
  final String id;
  final String title;
  final String description;
  // final String imageUrl;
  final String userId;
  final String createdAt;

  Article({
    required this.id,
    required this.title,
    required this.description,
    // required this.imageUrl,
    required this.userId,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      // 'imageUrl': imageUrl,
      'userId': userId,
      'createdAt': createdAt,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      // imageUrl: map['imageUrl'],
      userId: map['userId'],
      createdAt: map['createdAt'],
    );
  }
}
