import 'package:crocs/src/services/user_services/user_services.dart';
import 'package:crocs/src/view/pages/account/cubit/state/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(InitialState());
  void fetchData() async {    
    final response = await UserServices().getUserData();
    if(response is bool && !response){
      emit(NotLoggedState());
    }else{
      emit(LoadedState(response));
    }
  }

}
