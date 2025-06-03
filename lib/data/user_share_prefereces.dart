
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  static Future<String?> getUserData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> saveUserData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    print("Saving $key with value: $value");
    await prefs.setString(key, value);
  }

  static Future<void> removeUserData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", "Unknown User");
    await prefs.setString("email", email);
    await prefs.setString("password", password);
    await prefs.setBool("isLogin", true);
  }

  static Future<void> register(
    String username,
    String email,
    String password,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", username);
    await prefs.setString("email", email);
    await prefs.setString("password", password);
    await prefs.setBool("isLogin", true);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}