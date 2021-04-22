import 'package:flutter/material.dart';

import '../../models/article_model.dart';
import '../../services/news_service.dart';
import '../../utilities/text_styles.dart';
import '../article_view/artticle_view.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  NewsApi client = NewsApi();

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return FutureBuilder(
      future: client.fetchArticles(),
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        List<Article> article = snapshot.data;
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: article.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: () {
                print('Card pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleView(
                      article: article[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                child: Center(
                  child: Container(
                    width: orientation == Orientation.portrait
                        ? widget.width * 0.9
                        : widget.width,
                    height: orientation == Orientation.portrait
                        ? widget.height * 0.3
                        : widget.height * 0.5,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      image: DecorationImage(
                        image: article[index].imageUrl == null
                            ? ExactAssetImage('assets/images/placeholder.jpg')
                            : NetworkImage(article[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      width: widget.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      constraints: BoxConstraints.tightForFinite(),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            article[index].title == null
                                ? 'Title Not Available'
                                : article[index].title,
                            softWrap: true,
                            style: inLineStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              height: 1.1,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            article[index].author == null
                                ? 'Unknown'
                                : article[index].author,
                            softWrap: true,
                            style: inLineStyle.copyWith(
                              color: Colors.white60,
                              fontSize: 12,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return buildCircularIndicator();
      },
    );
  }

  Container buildCircularIndicator() {
    return Container(
      width: widget.width,
      height: widget.height - 200,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
