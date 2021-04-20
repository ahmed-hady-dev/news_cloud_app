import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';
import '../models/articles_list_model.dart';

class NewsApi {
  final String apiKey = 'd38e71bea4d046d480ab55fa962fb897';
  Future<List<Article>> fetchArticles() async {
    try {
      String url =
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesList articles = ArticlesList.fromJson(jsonData);
        List<Article> articlesList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<Article>> fetchArticlesByCategory(String category) async {
    try {
      String url =
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey';
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesList articles = ArticlesList.fromJson(jsonData);
        List<Article> articlesList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }
}
