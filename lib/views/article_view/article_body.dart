import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/article_model.dart';
import '../../utilities/text_styles.dart';

class ArticleBody extends StatelessWidget {
  const ArticleBody({
    Key key,
    @required this.orientation,
    @required this.height,
    @required this.width,
    @required this.article,
  }) : super(key: key);

  final Orientation orientation;
  final double height;
  final double width;
  final Article article;

  void _launchURL() async => await canLaunch(article.articleUrl)
      ? await launch(article.articleUrl)
      : throw 'Could not launch $article.articleUrl';
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: orientation == Orientation.portrait ? height * 0.4 : height * 0.5,
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                'Source:',
                style: inLineStyle.copyWith(
                  color: Colors.black38,
                  fontSize: 10,
                ),
              ),
            ),
            Text(
              article.author == null ? 'Unknown' : article.author,
              style: inLineStyle.copyWith(color: Colors.black, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                article.description == null
                    ? 'Description not available'
                    : article.description,
                style: inLineStyle.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                'Read more :',
                style: inLineStyle.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: InkWell(
                onTap: _launchURL,
                child: Text(
                  article.articleUrl == null
                      ? 'article not available'
                      : article.articleUrl,
                  style: inLineStyle.copyWith(
                    color: Colors.indigo,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
