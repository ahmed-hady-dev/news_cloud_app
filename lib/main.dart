import 'package:flutter/material.dart';
import 'package:news_cloud_app/view_models/list_of_articles_view_model.dart';
import 'package:news_cloud_app/views/home_view.dart';

import 'services/news_service.dart';

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
      home: HomeView(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GestureDetector(
//           onTap: () async {
//             NewsApi newsApi = NewsApi();
//             var articles = await newsApi.fetchArticlesByCategory('sport');
//             for (var article in articles) {
//               print(article.title);
//             }
//           },
//           child: Text('fetch data'),
//         ),
//       ),
//     );
//   }
// }
