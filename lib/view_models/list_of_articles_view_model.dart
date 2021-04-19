import 'package:news_cloud_app/models/article_model.dart';
import 'package:news_cloud_app/services/news_service.dart';

class ArticlesListViewModel {
  List<Article> _atriclesList = [];
  List<Article> _atriclesListByCategory = [];

  List<Article> get atriclesList => this._atriclesList;

  List<Article> get atriclesListByCategory => this._atriclesListByCategory;

  fetchArticles() async {
    _atriclesList = await NewsApi().fetchArticles();
  }

  fetchArticlesByCategory(String category) async {
    _atriclesListByCategory = await NewsApi().fetchArticlesByCategory(category);
  }
}
