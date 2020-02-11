import 'package:demo_app/data/datasource/omdb_movie_remote_datasource.dart';
import 'package:demo_app/data/models/omdb_movie_short_info.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/util/router.dart';
import 'package:demo_app/presentation/splash/splash_page.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /// TODO : remove this code
    OMDBMovieRemoteDatasourceImpl.create()
        .searchMovie(contentSearch: 'Falling')
        .then((value) {
      value.forEach((item) {
        print(item.imdbID);
      });
    });

    return MaterialApp(
      title: 'Home Navigation',
      onGenerateRoute: Router.routeMapping,
      home: SplashPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.deepPurple,
      ),
    );
  }

}
