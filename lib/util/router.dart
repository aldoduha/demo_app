import 'package:demo_app/presentation/dashboard/dashboard_page.dart';
import 'package:demo_app/presentation/home/home_page.dart';
import 'package:demo_app/presentation/login/login_page.dart';
import 'package:demo_app/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Router {

  static Map<String, Route<dynamic>> routes = {
    _Routes.splashPage: MaterialPageRoute(builder: (_) => SplashPage()),
    _Routes.loginPage: MaterialPageRoute(builder: (_) => LoginPage()),
    _Routes.homePage: MaterialPageRoute(builder: (_) => HomePage()),
    _Routes.dashboardPage: MaterialPageRoute(builder: (_) => DashboardPage())
  };

  static Route<dynamic> routeMapping(RouteSettings routeSettings) {
    return routes[routeSettings.name];
  }

}

class _Routes {
  static const String loginPage = '/login';
  static const String splashPage = '/splash';
  static const String homePage = '/home';
  static const String dashboardPage = '/dashboard';
}