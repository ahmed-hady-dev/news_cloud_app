import 'package:flutter/material.dart';
import 'package:news_cloud_app/services/news_service.dart';

import '../../utilities/text_styles.dart';
import 'article_card.dart';
import 'category_card_row.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    NewsApi client = NewsApi();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: RichText(
          text: TextSpan(text: "News ", style: headlineStyle, children: [
            TextSpan(
                text: 'Cloud',
                style: headlineStyle.copyWith(color: Colors.red[800])),
          ]),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await client.fetchArticles();
          print('refreshed');
        },
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              CategoryCardRow(height: height, width: width),
              ArticleCard(width: width, height: height),
            ],
          ),
        ),
      ),
    );
  }
}
