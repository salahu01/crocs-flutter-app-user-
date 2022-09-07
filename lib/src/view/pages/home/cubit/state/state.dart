import 'package:crocs/src/model/category_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class InitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedState extends HomeState {
  LoadedState(this.category);

  final List<CategoryModel> category;

  @override
  List<Object> get props => [category];
}

class ErrorState extends HomeState {
  @override
  List<Object> get props => [];
}

class NetworkErrorState extends HomeState {
  @override
  List<Object> get props => [];
}
