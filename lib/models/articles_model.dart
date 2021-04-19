import 'package:news_cloud_app/models/article_model.dart';

class Articles {
  final List<dynamic> articles;

  Articles({this.articles});

  factory Articles.fromJson(Map<String, dynamic> jsonData) {
    return Articles(articles: jsonData['articles']);
  }
}
