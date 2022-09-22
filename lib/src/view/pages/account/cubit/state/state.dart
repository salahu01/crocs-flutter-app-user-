import 'package:crocs/src/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable {}

class InitialState extends AccountState {
  @override
  List<Object> get props => [];
}


class LoadingState extends AccountState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AccountState {
  LoadedState(this.userModel);

  final List<UserModel> userModel;

  @override
  List<Object> get props => [userModel];
}

class NotLoggedState extends AccountState {
  @override
  List<Object> get props => [];
}
