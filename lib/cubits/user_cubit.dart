import 'package:equatable/equatable.dart';
import 'package:paramita_loyalty_app/models/model.dart';
import 'package:bloc/bloc.dart';
import 'package:paramita_loyalty_app/services/service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String phoneNum, String pin) async {
    ApiReturnValue<User> result = await UserServices.signIn(phoneNum, pin);

    if(result.value != null){
      emit(UserLoaded(result.value));
    }else{
      emit(UserLoadingFailed(result.message));
    }
  }
}