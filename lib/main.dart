
import 'package:demo_app/common/config/injector.dart';
import 'package:demo_app/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/util/router.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await setupInjections();

  runApp(DemoApp());
}


class DemoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

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
