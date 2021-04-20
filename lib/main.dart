import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_models/list_of_articles_view_model.dart';
import 'views/home_view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticlesListViewModel>(
      create: (context) => ArticlesListViewModel(),
      child: MaterialApp(
        title: 'News Cloud',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Helvetica',
          textTheme: TextTheme(),
          primarySwatch: Colors.red,
        ),
        home: HomeView(),
      ),
    );
  }
}
