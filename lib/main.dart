import 'package:flutter/material.dart';
import 'routes/router.dart';
import 'package:demo_app/pages/splash/splash_page.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Navigation',
      routes: Router.routes,
      onGenerateRoute: Router.onGenerateRoute,
      onUnknownRoute: Router.onUnknownRoute,
       home: SplashPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.deepPurple,
      ),
    );
  }

}
