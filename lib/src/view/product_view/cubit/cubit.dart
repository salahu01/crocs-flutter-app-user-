import 'package:bloc/bloc.dart';

class ProductCubit extends Cubit<String> {
  ProductCubit() : super('S');
  void changeSize(String size) => emit(size);
}
