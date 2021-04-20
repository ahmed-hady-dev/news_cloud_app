class Article {
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String author;

  Article({
    this.title,
    this.description,
    this.imageUrl,
    this.articleUrl,
    this.author,
  });
  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
      title: jsonData['title'],
      description: jsonData['description'],
      imageUrl: jsonData['urlToImage'],
      articleUrl: jsonData['url'],
      author: jsonData['author'],
    );
  }
}
