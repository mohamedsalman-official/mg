import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mg/utils/contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<bool> getLoginDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Constants.getTrack) ?? false;
  }

  static setLoginStatus(bool? isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isLogin is bool) {
      await prefs.setBool(SharedPrefKeys.isLogin, isLogin);
    }
  }

  static setBearer(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(SharedPrefKeys.bearerToken, value);
    }
  }

  static Future<String> getBearer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.bearerToken) ?? '';
  }

  static setUserName(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(SharedPrefKeys.userName, value);
    }
  }

  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.userName) ?? '';
  }

  static setId(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(SharedPrefKeys.Id, value);
    }
  }

  static Future<String> getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.Id) ?? '';
  }

  static Future<bool> getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefKeys.isLogin) ?? false;
  }
}

clearPreference() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
