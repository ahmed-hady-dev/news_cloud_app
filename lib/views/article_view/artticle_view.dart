import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/article_model.dart';
import '../../utilities/text_styles.dart';

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
          Positioned(
            height: orientation == Orientation.portrait
                ? height * 0.45
                : height * 0.55,
            width: width,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                image: DecorationImage(
                  image: article.imageUrl == null
                      ? ExactAssetImage('assets/images/placeholder.jpg')
                      : NetworkImage(article.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Transform.translate(
                offset: Offset(0, -height * 0.05),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article.title,
                      style: headlineStyle.copyWith(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: width * 0.03,
            top: height * 0.06,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: BackButton(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            // top: height * 0.4,
            top: orientation == Orientation.portrait
                ? height * 0.4
                : height * 0.5,
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
                    style:
                        inLineStyle.copyWith(color: Colors.black, fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
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
          ),
        ],
      ),
    );
  }
}
