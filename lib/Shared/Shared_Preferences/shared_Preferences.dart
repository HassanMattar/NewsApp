import 'package:shared_preferences/shared_preferences.dart';

class Shared_Preferences {
  static SharedPreferences? preferences;

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static setBoolean(key, value)async {
   await preferences?.setBool(key, value);
  }

  static bool? getBoolean(key) {
    return preferences?.getBool(key) ;

    
  }
}
