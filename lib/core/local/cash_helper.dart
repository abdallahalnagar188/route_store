import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveLogin(bool value) async {
    await _prefs?.setBool('isLogin', value);
  }

  static bool getLogin() {
    return _prefs?.getBool('isLogin') ?? false;
  }

  static Future<void> logout() async {
    await _prefs?.remove('isLogin');
  }
}
