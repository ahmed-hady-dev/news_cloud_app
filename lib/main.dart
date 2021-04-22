import 'package:flutter/material.dart';

import 'navigator/named_navigator.dart';
import 'navigator/named_navigator_impl.dart';
import 'views/home_view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Cloud',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME_VIEW,
      onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
      navigatorKey: NamedNavigatorImpl.navigatorState,
      theme: ThemeData(
        fontFamily: 'Helvetica',
        textTheme: TextTheme(),
        primarySwatch: Colors.red,
      ),
      home: HomeView(),
    );
  }
}
