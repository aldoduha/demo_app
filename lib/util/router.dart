import 'package:demo_app/common/config/injector.dart';
import 'package:demo_app/presentation/bloc/omdb_movie_bloc.dart';
import 'package:demo_app/presentation/pages/home/home_page.dart';
import 'package:demo_app/presentation/pages/login/login_page.dart';
import 'package:demo_app/presentation/pages/splash/splash_page.dart';
import 'package:demo_app/util/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Router {

  static Route<dynamic> routeMapping(RouteSettings routeSettings) {
    return routes[routeSettings.name];
  }

  static Map<String, Route<dynamic>> routes = {
    RoutePath.splashPage: _getMaterialPageRoute(SplashPage()),
    RoutePath.loginPage: _getMaterialPageRoute(LoginPage()),
    RoutePath.homePage: _getMaterialPageRouteWithBloc(blocProviderList: _dashboardBlocProviderList()),
    RoutePath.dashboardPage: _getMaterialPageRouteWithBloc(
        page: HomePageOptions.dashboard,
        blocProviderList: _dashboardBlocProviderList()),
    RoutePath.searchPage: _getMaterialPageRouteWithBloc(page: HomePageOptions.search),
    RoutePath.favoritePage: _getMaterialPageRouteWithBloc(page: HomePageOptions.favorite),
    RoutePath.settingPage: _getMaterialPageRouteWithBloc(page: HomePageOptions.settings),
  };

  static MaterialPageRoute _getMaterialPageRoute(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }

  static MaterialPageRoute _getMaterialPageRouteWithBloc({
    HomePageOptions page, List<BlocProvider> blocProviderList}) {
    return MaterialPageRoute(
        builder: (context) => _getMultiBlocProvider(page:page, blocProviderList: blocProviderList));
  }

  static MultiBlocProvider _getMultiBlocProvider({HomePageOptions page, List<BlocProvider> blocProviderList}) {
    return MultiBlocProvider(
      providers: blocProviderList,
      child: HomePage(page: page),
    );
  }

  static List<BlocProvider> _dashboardBlocProviderList() {
    return [
      BlocProvider<OMDBMovieBloc>(
        create: (BuildContext context) => getIt<OMDBMovieBloc>(),
      ),
    ];
  }
}
