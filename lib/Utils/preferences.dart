import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<bool> userSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("UserSignedIn") ?? false;
  }

  static void userSaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("UserSignedIn", true);
  }

  static void saveUserInfo(
      {File? img, required String name, required String phoneCode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        "UserInfo", [name, (img != null) ? img.path : "", phoneCode]);
  }

  static Future<List<String>> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("UserInfo") ?? [];
  }
}
