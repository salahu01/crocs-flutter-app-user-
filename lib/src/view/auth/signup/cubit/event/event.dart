import 'package:bloc/bloc.dart';
import 'package:crocs/src/services/api/auth_services/auth_services.dart';
import 'package:flutter/material.dart';
import '../state/state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(InitialState());
  void validate(
      {required String email,
      required String password,
      required String userName,
      required BuildContext context}) {
    if (email.contains('@gmail.com') &&
        password.length >= 8 &&
        userName.length >= 4) {
      signUp(
        email: email,
        password: password,
        userName: userName,
        context: context,
      );
    } else {
      showMessage(context, 'Enter Valid User Deatails !');
    }
  }

  void signUp(
      {required String email,
      required String password,
      required String userName,
      required context}) async {
    emit(LoadingState());
    final response = await AuthServices()
        .signUp(userName: userName, email: email, password: password);
    if (response == true) {
      Navigator.pop(context);
    } else {
      emit(ErrorState());
      showMessage(context, response.toString());
    }
  }

  showMessage(context, String data) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 200), content: Text(data)));

  bool storeData() {
    return true;
  }
}
