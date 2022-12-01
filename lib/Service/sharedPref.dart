import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/UserModel.dart';

class sharedPref {
  void storeVal(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  getVal(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Future removeVal(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove(key);
  //   return 'done';
  // }

  void saveuserData(var res) {
    UserModel model = UserModel(
      email: res['email'],
      id: res['id'],
      name: res['name'],
      phone: res['phone'],
      profile: res['profile'],
      role: res['role'],
    );
    String modelData = jsonEncode(model);
    sharedPref().storeVal('userData', modelData);
  }
}
