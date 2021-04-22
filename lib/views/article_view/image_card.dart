import 'package:flutter/material.dart';

import '../../models/article_model.dart';
import '../../utilities/text_styles.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
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

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height:
          orientation == Orientation.portrait ? height * 0.45 : height * 0.55,
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
              child: Text(article.title, style: inLineStyle),
            ),
          ),
        ),
      ),
    );
  }
}
