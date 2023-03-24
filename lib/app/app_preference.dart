import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  final SharedPreferences _sharedPreferences;

  AppPreference(this._sharedPreferences);

  final String TOKEN_KEY = "TOKEN_KEY";

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(TOKEN_KEY, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(TOKEN_KEY) ?? "";
  }
}
