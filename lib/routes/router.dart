import 'package:flutter/material.dart';
import 'package:demo_app/pages/dashboard/dashboard_page.dart';
import 'package:demo_app/pages/home/home_page.dart';
//import 'package:demo_app/pages/login/login_page.dart';
import 'package:demo_app/pages/not_found_page.dart';
import 'package:demo_app/pages/splash/splash_page.dart';
import 'package:demo_app/routes/routes.dart';

abstract class Router {
  static Map<String, WidgetBuilder> routes = {
    Routes.splash: (BuildContext context) => SplashPage(),
//    Routes.login: (BuildContext context) => LoginPage(),
    Routes.home: (BuildContext context) => HomePage(),
//    Routes.dashboard: (BuildContext context) => HomePage(page: HomePageOptions.dashboard,),
//    Routes.search: (BuildContext context) => HomePage(page: HomePageOptions.serarch,),
//    Routes.favoriteList: (BuildContext context) => HomePage(page: HomePageOptions.favorite,),
//    Routes.settings: (BuildContext context) => HomePage(page: HomePageOptions.settings,),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '') {
      return null;
    } else if (pathElements[1] == Routes.favoriteDetailsPath) {
      return MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      );
    }
    return null;
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return NotFoundPage();
        },
      );
  }

}