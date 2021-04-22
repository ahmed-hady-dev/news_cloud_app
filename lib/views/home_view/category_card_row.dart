import 'package:flutter/material.dart';

import '../../models/category_card_model.dart';
import 'category_card.dart';

class CategoryCardRow extends StatefulWidget {
  CategoryCardRow({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;

  final double width;

  @override
  _CategoryCardRowState createState() => _CategoryCardRowState();
}

class _CategoryCardRowState extends State<CategoryCardRow> {
  static String asset = 'assets/images/';
  static List<String> name = [
    'general',
    'sports',
    'health',
    'science',
    'technology',
    'business',
    'business',
    'entertainment'
  ];
  List<CategoryCardModel> categoryCardList = [
    CategoryCardModel('General', '${asset + name[0]}.jpg', () {}, name[0]),
    CategoryCardModel('Sports', '${asset + name[1]}.jpg', () {}, name[1]),
    CategoryCardModel('Health', '${asset + name[2]}.jpg', () {}, name[2]),
    CategoryCardModel('Science', '${asset + name[3]}.jpg', () {}, name[3]),
    CategoryCardModel('Technology', '${asset + name[4]}.jpg', () {}, name[4]),
    CategoryCardModel('Business', '${asset + name[5]}.jpg', () {}, name[5]),
    CategoryCardModel(
        'Entertainment', '${asset + name[6]}.jpg', () {}, name[6]),
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      height: orientation == Orientation.portrait
          ? widget.height * 0.09
          : widget.height * 0.19,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryCardList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: categoryCardList[index].onPressed,
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            child: CategoryCard(
              width: widget.width,
              height: widget.height,
              imagePath: categoryCardList[index].imagePath,
              title: categoryCardList[index].title,
            ),
          ),
        ),
      ),
    );
  }
}
