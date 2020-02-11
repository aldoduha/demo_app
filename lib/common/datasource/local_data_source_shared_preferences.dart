import 'package:demo_app/common/datasource/local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceSharedPreferences implements LocalDataSource {

    final SharedPreferences sharedPreferences;

  LocalDataSourceSharedPreferences({@required this.sharedPreferences});

  String getStringValue({@required String key}) {
    return sharedPreferences.getString(key);
  }

  Future<bool> setStringValue({@required String key, String value}) {
    return sharedPreferences.setString(key, value);
  }

  List<String> getListValue({@required String key}) {
    return sharedPreferences.getStringList(key);
  }

  Future<bool> setListValue({@required String key, List<String> values}) {
    return sharedPreferences.setStringList(key, values);
  }

  Future<dynamic> getToken() {

  }

  Future<dynamic> setToken() {

  }

  Future<dynamic> removeToken() {

  }


}