import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lunarestate/Models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class UserData with ChangeNotifier {
  String? id, name, email, phone, profile, role;

  String get getInitid => id!;

  Future initUserData() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('userData');
    if (data != null) {
      Map<String, dynamic> jsonData = jsonDecode(data);
      UserModel uModel = UserModel.fromJson(jsonData);
      id = uModel.id;
      name = uModel.name;
      email = uModel.email;
      log('User id $id');
      phone = uModel.phone;
      profile = uModel.profile;
      role = uModel.role;
      notifyListeners();
    }
    return name;
  }
}
