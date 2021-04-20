import 'package:flutter/material.dart';
import 'package:news_cloud_app/models/category_card_model.dart';
import 'package:provider/provider.dart';

import '../models/article_model.dart';
import '../utilities/text_styles.dart';
import '../view_models/list_of_articles_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isLoading = true;
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    List<Article> variable;
    variable =
        Provider.of<ArticlesListViewModel>(context, listen: false).atriclesList;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('News Cloud', style: headlineStyle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.09,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryCardList.length,
              itemBuilder: (context, index) => CategoryCard(
                width: width,
                height: height,
                imagePath: categoryCardList[index].imagePath,
                title: categoryCardList[index].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
    return Container(
      width: width * 0.4,
      height: height * 0.07,
      margin: EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black38,
        image: DecorationImage(
          image: ExactAssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
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

// Container(
//         child: _isLoading == true
//             ? Center(child: CircularProgressIndicator())
//             : Center(
//                 child: ListView.builder(
//                   itemCount: variable.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         variable[index].title,
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//       ),
