import 'dart:convert';
import 'package:crocs/src/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  Future<bool> getPilatesPageStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('pilates') == null ? false : true;
  }

  Future<bool> setpilatesPageStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool('pilates', true);
  }

  Future<bool> setUserData(json) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('userData', jsonEncode(json));
  }

  Future<dynamic> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final res = prefs.getString('userData');
    return res == null ? false : UserModel.fromJson(jsonDecode(res.toString()));
  }
  
}
