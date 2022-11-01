import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // get data
  static Future<dynamic> getData({required String key}) async {
    return sharedPreferences!.get(key);
  }

  // save data
  static Future<dynamic> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    return value;
  }

  // remove data
  static Future<bool?> removeData({required String key}) async {
    return sharedPreferences!.remove(key);
  }
}
