import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crocs/src/model/product_model.dart';

import '../../../../../../services/api/data_services/data_services.dart';
import '../state/state.dart';

class ProductCardCubit extends Cubit<ProductCardState> {
  ProductCardCubit(String id) : super(InitialState()) {
    fetchData(id);
  }
  fetchData(String id) async {
    emit(LoadingState());
    final ProductModel? response = await DataServices().fetchingProduct(id: id);
    if (response == null) {
      log('Empty');
      
    } else {
      emit(LoadedState(response));
    }
  }
}
