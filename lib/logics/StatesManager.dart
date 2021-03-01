import 'package:flutter_p32929/logics/StatesHolder.dart';
import 'package:flutter_p32929/models/StatesHolder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatesManager {
  // model er
  static StatesHolders states = StatesHolders();

  // Data er
  static StateHolder stateData = StateHolder();
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static setToken(accesstoken) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setString('accesstoken', accesstoken);
    print(prefs.getString('accesstoken'));
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('accesstoken');
  }
}
