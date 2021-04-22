class CategoryCardModel {
  String _title;
  String _imagePath;
  Function _onPressed;
  String _category;

  CategoryCardModel(
      this._title, this._imagePath, this._onPressed, this._category);

  String get title => _title;
  String get category => _category;
  String get imagePath => _imagePath;
  Function get onPressed => _onPressed;
}
