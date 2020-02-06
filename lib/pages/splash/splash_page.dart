
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {

  static final String splashImageURL = 'https://cdn.dribbble.com/users/1117770/screenshots/2626626/welcome.gif';

  @override
  void initState() {
    super.initState();
    _showNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(splashImageURL),
      color: Colors.white,
    );
  }


  void _showNextPage() {
    /// todo : check token already exist. if exist then the next page is page home.

    Future.delayed(Duration(seconds: 4), () => Navigator.of(context).pushReplacementNamed('/home'));
  }

}