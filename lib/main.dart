import 'package:flutter/material.dart';
import 'package:news_cloud_app/services/news_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Cloud',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            NewsApi newsApi = NewsApi();
            var articles = await newsApi.fetchArticlesByCategory('health');
            for (var article in articles) {
              print(article.title);
            }
          },
          child: Text('fetch data'),
        ),
      ),
    );
  }
}
