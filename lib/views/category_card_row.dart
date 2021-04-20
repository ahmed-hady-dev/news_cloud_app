import 'package:flutter/material.dart';

import '../models/category_card_model.dart';
import '../view_models/list_of_articles_view_model.dart';
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
  ArticlesListViewModel articlesListViewModel = ArticlesListViewModel();

  List<CategoryCardModel> categoryCardList = [
    CategoryCardModel('General', 'assets/images/general.jpg'),
    CategoryCardModel('Sports', 'assets/images/sports.jpg'),
    CategoryCardModel('Health', 'assets/images/health.jpg'),
    CategoryCardModel('Science', 'assets/images/science.jpg'),
    CategoryCardModel('Technology', 'assets/images/technology.jpg'),
    CategoryCardModel('Business', 'assets/images/business.jpg'),
    CategoryCardModel('Entertainment', 'assets/images/entertainment.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.09,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryCardList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          child: CategoryCard(
            width: widget.width,
            height: widget.height,
            imagePath: categoryCardList[index].imagePath,
            title: categoryCardList[index].title,
          ),
        ),
      ),
    );
  }
}
