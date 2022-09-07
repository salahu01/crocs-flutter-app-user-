import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {}

class InitialState extends SignUpState {
  @override
  List<Object> get props => [];
}

class LoadingState extends SignUpState {
  @override
  List<Object> get props => [];
}

class ErrorState extends SignUpState {
  @override
  List<Object> get props => [];
}

class SuccessState extends SignUpState {
  @override
  List<Object> get props => [];
}
