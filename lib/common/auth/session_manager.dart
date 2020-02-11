import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {

  static const String TOKEN_KEY = 'token-login';

  final SharedPreferences sharedPreferences;

  SessionManager({@required this.sharedPreferences});

  String getToken() {
    return sharedPreferences.getString(TOKEN_KEY);
  }

  Future<bool> setToken(String tokenValue) {
    return sharedPreferences.setString(TOKEN_KEY, tokenValue);
  }

  Future<bool> removeToken(String tokenValue) {
    return sharedPreferences.remove(TOKEN_KEY);
  }

}