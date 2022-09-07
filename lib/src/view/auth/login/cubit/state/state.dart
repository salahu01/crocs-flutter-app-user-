import 'package:equatable/equatable.dart';

abstract class LogInState extends Equatable {}

class InitialState extends LogInState {
  @override
  List<Object> get props => [];
}

class LoadingState extends LogInState {
  @override
  List<Object> get props => [];
}

class ErrorState extends LogInState {
  @override
  List<Object> get props => [];
}

class SuccessState extends LogInState {
  @override
  List<Object> get props => [];
}
