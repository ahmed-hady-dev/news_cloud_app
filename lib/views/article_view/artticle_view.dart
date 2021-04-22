import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/article_model.dart';
import 'article_body.dart';
import 'image_card.dart';
import 'pop_button.dart';

class ArticleView extends StatelessWidget {
  final Article article;

  ArticleView({Key key, this.article});
  void _launchURL() async => await canLaunch(article.articleUrl)
      ? await launch(article.articleUrl)
      : throw 'Could not launch $article.articleUrl';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          ImageCard(
              orientation: orientation,
              height: height,
              width: width,
              article: article),
          PopButton(width: width, height: height),
          ArticleBody(
            article: article,
            height: height,
            width: width,
            orientation: orientation,
          ),
        ],
      ),
    );
  }
}
