import 'package:crocs/model/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductCardState extends Equatable {}

class InitialState extends ProductCardState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ProductCardState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ProductCardState {
  LoadedState(this.product);

  final ProductModel product;

  @override
  List<Object> get props => [product];
}

class ErrorState extends ProductCardState {
  @override
  List<Object> get props => [];
}