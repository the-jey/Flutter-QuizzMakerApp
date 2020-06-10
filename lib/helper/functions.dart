import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class HelperFunctions {
  static String userLoggedInKey = 'USERLOGGEDINKEY';

  static saveUserLoggedInDetails({@required bool isLoggedIn}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(userLoggedInKey, isLoggedIn);
  }

  static getUserLoggedInDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKey);
  }
}
