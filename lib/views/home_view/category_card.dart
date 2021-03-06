import 'package:flutter/material.dart';

import '../../utilities/text_styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.width,
    @required this.height,
    @required this.title,
    @required this.imagePath,
  });

  final double width;
  final double height;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      width: orientation == Orientation.portrait ? width * 0.4 : width * 0.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black38,
        image: DecorationImage(
          image: ExactAssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Text(
        title,
        style: inLineStyle,
        softWrap: true,
      ),
    );
  }
}
