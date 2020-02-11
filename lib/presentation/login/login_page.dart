import 'package:demo_app/common/auth/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final loginController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image(
          image: AssetImage('images/movie-logo.png'),
        ),
      ),
    );
//    final _email = _textFormField(hintText: 'Email');
    final _password = _textFormField(obscureText: true, autoFocus: true);
    final _loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: _button('LOGIN'),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            _password,
            SizedBox(height: 10.0),
            _loginButton,
//            forgotLabel
          ],
        ),
      ),
    );
  }

  TextFormField _textFormField(
      {String initValue,
      String hintText,
      bool obscureText = false,
      bool autoFocus = false}) {
    return TextFormField(
      controller: loginController,
      autofocus: autoFocus,
      initialValue: initValue,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  MaterialButton _button(String label) {
    return MaterialButton(
      minWidth: 200.0,
      height: 42.0,
      onPressed: () async {
        _storeToken();
        Navigator.pushReplacementNamed(context, '/home');
      },
      color: Colors.lightBlueAccent,
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }

  void _storeToken() async {
    SessionManager sessionManager = SessionManager(sharedPreferences: await SharedPreferences.getInstance());
    sessionManager.setToken(loginController.text);
  }

}
