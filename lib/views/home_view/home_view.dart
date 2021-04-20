import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('News Cloud', style: headlineStyle),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategoryCardRow(height: height, width: width),
            ArticleCard(width: width, height: height),
          ],
        ),
      ),
    );
  }
}
