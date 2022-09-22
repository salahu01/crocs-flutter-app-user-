import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crocs/src/model/user_model.dart';
import 'package:crocs/src/services/api/auth_services/auth_services.dart';
import 'package:flutter/material.dart';

import '../state/state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(InitialState());
  void validate(
      {required String email,
      required String password,
      required BuildContext context}) {
    if (email.contains('@gmail.com') && password.length >= 8) {
      logIn(email: email, password: password, context: context);
    } else {
      showMessage(context, 'Enter Valid User Details !');
    }
  }

  void logIn(
      {required String email,
      required String password,
      required context}) async {
    emit(LoadingState());
    final response =
        await AuthServices().logIn(email: email, password: password);
        log(response.toString());
    if (response is UserModel) {
      Navigator.pop(context);
    } else {
      emit(ErrorState());
      showMessage(context, response.toString());
    }
  }

  showMessage(context, String data) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 200),
          content: Text(data),
        ),
      );
}
