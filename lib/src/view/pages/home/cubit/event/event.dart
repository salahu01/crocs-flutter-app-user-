import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../../../services/api/data_services/data_services.dart';
import '../state/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState()) {
    fetchData();
  }
  void fetchData() async {
    emit(LoadingState());
    final response = await DataServices().fetchingCategory();
    if (response.isEmpty) {
      log('Empty');
    } else if(response == 'e'){
      emit(ErrorState());
    }else if(response == 'network error'){
      emit(NetworkErrorState());
    }else{
      emit(LoadedState(response));
    }
  }
}
