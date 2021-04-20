import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/article_model.dart';
import '../../utilities/text_styles.dart';
import '../../view_models/list_of_articles_view_model.dart';

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
  bool _isLoading = true;
  List<Article> variable;
  Future<bool> fetchData() async {
    await Provider.of<ArticlesListViewModel>(context, listen: false)
        .fetchArticles();
    setState(() {
      _isLoading = false;
    });
    return _isLoading;
  }

  @override
  initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    variable =
        Provider.of<ArticlesListViewModel>(context, listen: false).atriclesList;

    return _isLoading == true
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: variable.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Stack(
              children: [
                Center(
                  child: Container(
                    width: widget.width * 0.9,
                    height: widget.height * 0.3,
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      image: DecorationImage(
                        image: NetworkImage(variable[index].imageUrl == null
                            ? networkImagPlacholder
                            : variable[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 6,
                  left: 6,
                  child: Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          variable[index].title == null
                              ? 'Title Not Available'
                              : variable[index].title,
                          softWrap: true,
                          style: inLineStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          variable[index].author == null
                              ? 'Unknown'
                              : variable[index].author,
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
              ],
            ),
          );
  }
}
