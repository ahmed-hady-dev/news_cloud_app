class Routes {
  static const ARTICLE_VIEW = "ARTICLE_VIEW";
  static const HOME_VIEW = "HOME_VIEW";
}

abstract class NamedNavigator {
  Future push(String routeName,
      {dynamic arguments, bool replace = false, bool clean = false});

  void pop({dynamic result});
}
