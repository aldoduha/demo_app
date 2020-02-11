import 'package:demo_app/common/auth/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/util/fade_in_animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _openNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Row(children: <Widget>[
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 50),
                alignment: AlignmentDirectional.centerStart,
                child: FadeInAnimation(
                  begin: 0.0,
                  end: 1.0,
                  duration: 2,
                  child: Text(
                    'Movie',
                    style: TextStyle(
                      fontFamily: 'Molle',
                      fontSize: 90,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.white60,
                          blurRadius: 10.0,
                          offset: Offset(-10.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
                margin: EdgeInsets.only(right: 50),
                alignment: AlignmentDirectional.centerEnd,
                child: FadeInAnimation(
                  begin: 0.0,
                  end: 1.0,
                  duration: 1,
                  child: Text(
                    'Bucket',
                    style: TextStyle(
                      fontFamily: 'Molle',
                      fontSize: 90,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.white60,
                          blurRadius: 10.0,
                          offset: Offset(-10.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        )),
      ]),
    ));
  }

  Future<void> _openNextPage() async {
    String token = SessionManager(sharedPreferences: await SharedPreferences.getInstance()).getToken();
    if(token == null) {
      Future.delayed(Duration(seconds: 3),
              () => Navigator.pushReplacementNamed(context, "/login"));
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<String> _getToken() async {
    return SessionManager(sharedPreferences: await SharedPreferences.getInstance()).getToken();
  }
}
