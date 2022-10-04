import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setToken(String value) {
    return _sharedPreferences!.setString('token', value);
  }

  String? getToken() {
    try {
      return _sharedPreferences!.getString('token');
    } catch (e) {
      return null;
    }
  }

  Future<void> setUserID(int value) {
    return _sharedPreferences!.setInt('userID', value);
  }

  Future<void> setUserId(int value) {
    return _sharedPreferences!.setInt('userId', value);
  }

  int? getUserId() {
    try {
      return _sharedPreferences!.getInt('userId');
    } catch (e) {
      return null;
    }
  }

  Future<void> setUsername(String value) {
    return _sharedPreferences!.setString('username', value);
  }

  String? getUsername() {
    try {
      return _sharedPreferences!.getString('username');
    } catch (e) {
      return null;
    }
  }

  Future<void> setUserEmail(String value) {
    return _sharedPreferences!.setString('userEmail', value);
  }

  String? getUserEmail() {
    try {
      return _sharedPreferences!.getString('userEmail');
    } catch (e) {
      return null;
    }
  }

  Future<void> setName(String value) {
    return _sharedPreferences!.setString('name', value);
  }

  String? getName() {
    try {
      return _sharedPreferences!.getString('name');
    } catch (e) {
      return null;
    }
  }

  Future<void> setUserType(int value) {
    return _sharedPreferences!.setInt('userType', value);
  }

  int? getUserType() {
    try {
      return _sharedPreferences!.getInt('userType');
    } catch (e) {
      return null;
    }
  }
}
