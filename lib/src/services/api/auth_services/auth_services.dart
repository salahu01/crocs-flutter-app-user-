import 'dart:convert';
import 'dart:io';
import 'package:crocs/src/model/user_model.dart';
import 'package:crocs/src/services/user_services/user_services.dart';
import 'package:dio/dio.dart';
import '../api_credentials/api.dart';

class AuthServices with Api {
  Future<dynamic> logIn({required email, required password}) async {
    try {
      final data = jsonEncode({
        // "email": "salahu@gmail.com",
        // "password": "12345678",
        "email": email,
        "password": password,
      });
      final response = await Dio().post('$uri/auth/login', data: data);
      if (response.statusCode == 201) {
        await UserServices().setUserData(response.data);
        return UserModel.fromJson(response.data);
      } else if (response.statusCode == 200) {
        return 'Wrong Password ! Enter Valid Password ';
      } else if (response.statusCode == 204) {
        return 'User not found ! Enter Valid User Details ';
      }
    } on DioError {
      return 'Something Went Wrong ! Please try again later ';
    } on SocketException {
      return 'Oops ! Connection refused .';
    }
  }

  signUp({required userName, required email, required password}) async {
    try {
      final data = jsonEncode({
        // "email": "salahu@gmail.com",
        // "password": "123345678",
        // "name": "salahu"
        "email": email,
        "password": password,
        "name": userName,
      });
      final response = await Dio().post('$uri/auth/signUp', data: data);
      if (response.statusCode == 201) {
        await UserServices().setUserData(response.data);
        return UserModel.fromJson(response.data);
      } else if (response.statusCode == 200) {
        return 'Wrong ! User Already Exist .';
      }
    } on DioError {
      return 'Something Went Wrong ! Please try again later ';
    } on SocketException {
      return 'Oops ! Connection refused .';
    }
  }
}
