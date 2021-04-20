import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/article_model.dart';
import '../utilities/text_styles.dart';
import '../view_models/list_of_articles_view_model.dart';
import 'category_card_row.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isLoading = true;

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
          CategoryCardRow(height: height, width: width),
          Container(
            width: width * 0.9,
            height: height * 0.4,
            decoration: BoxDecoration(
              color: Colors.black38,
              image: DecorationImage(
                image: ExactAssetImage('assets/images/placeholder.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          )
        ],
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
