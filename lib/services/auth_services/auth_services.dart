import 'dart:convert';
import 'dart:developer';

import 'package:crocs/services/api/api.dart';
import 'package:dio/dio.dart';

class AuthServices with Api {
  logIn({required email, required password}) async {
    try {
      final data =
          jsonEncode({"email": "salahu@gmail.com", "password": "12345678"});
      log(data);
      final response = await Dio().post('$uriLinux/auth/login', data: data);
      log(response.statusCode.toString());
      log(response.data.toString());
    } catch (e) {
      log('e = $e');
    }
  }

  signIn({required userName, required email, required password}) async {
    try {
      final data = jsonEncode({
        "email": "salahuu@gmail.com",
        "password": "123345678",
        "name": "salahh"
      });
      log(data);
      final response = await Dio().post('$uriLinux/auth/signUp', data: data);
      log(response.statusCode.toString());
      log(response.data.toString());
    } catch (e) {
      log('e = $e');
    }
  }
}
