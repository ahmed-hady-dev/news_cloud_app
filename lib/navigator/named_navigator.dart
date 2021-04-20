class Routes {
  static const SPLASH_ROUTE = "SPLASH_ROUTE";
  static const LOGIN_ROUTE = "LOGIN_ROUTE";
  static const SIGNUP_ROUTE = "SIGNUP_ROUTE";
  static const TERMS_ROUTE = "TERMS_ROUTE";
  static const ACTIVATION_CODE_ROUTE = "ACTIVATION_CODE_ROUTE";
  static const NEW_PASSWORD_ROUTE = "NEW_PASSWORD_ROUTE";
  static const FORGET_PASSWORD_ROUTE = "FORGET_PASSWORD_ROUTE";
  static const HOME_ROUTE = "HOME_ROUTE";
  static const MENU_ROUTE = "MENU_ROUTE";
  static const ABOUT_ROUTE = "ABOUT_ROUTE";
  static const NEW_ORDER_VIEW_ROUTE = "NEW_ORDER_VIEW_ROUTE";
  static const MY_WALLET_ROUTE = "MY_WALLET_ROUTE";
  static const PROFILE_ROUTE = "PROFILE_ROUTE";
  static const CHANGE_PASSWORD_ROUTE = "CHANGE_PASSWORD_ROUTE";
  static const RESERVATION_TAB_BAR_ROUTE = "RESERVATION_TAB_BAR_ROUTE";
  static const CONTACT_US_ROUTE = "CONTACT_US_ROUTE";
  static const NOTIFICATION_ROUTE = "NOTIFICATION_ROUTE";
  static const LOGIN_OR_NOT_ROUTE = "LOGIN_OR_NOT_ROUTE";
  static const RESERVATION_ROUTE = "RESERVATION_ROUTE";
  static const RESERVATION_DONE_ROUTE = "RESERVATION_DONE_ROUTE";
  static const RESTAURANT_DETAILS_VIEW_ROUTE = "RESTAURANT_DETAILS_VIEW_ROUTE";
}

abstract class NamedNavigator {
  Future push(String routeName,
      {dynamic arguments, bool replace = false, bool clean = false});

  void pop({dynamic result});
}
