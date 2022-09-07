import 'package:bloc/bloc.dart';

class ControllerCubit extends Cubit<int> {
  ControllerCubit() : super(0);
  void changePage(int index) => emit(index);
}
