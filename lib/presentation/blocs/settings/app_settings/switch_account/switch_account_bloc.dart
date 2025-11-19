import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:meta/meta.dart';
part 'switch_account_event.dart';
part 'switch_account_state.dart';

class SwitchAccountBloc extends Bloc<SwitchAccountEvent, SwitchAccountState> {
  final UserRepo userRepo;
  SwitchAccountBloc(this.userRepo) : super(SwitchAccountInitialState()) {
    on<SwitchIntoNewAccountEvent>(_handleSwitchAccountEvent);
  }

  FutureOr<void> _handleSwitchAccountEvent(SwitchIntoNewAccountEvent event, Emitter<SwitchAccountState> emit) async {
    // try{
      emit(SwitchAccountLoadingState());
      var result = await userRepo.switchAccount(event.accountId);
      if(result.success){
        emit(SwitchAccountLoadedState());
      }else{
        emit(SwitchAccountErrorState(message: result.message));
      }      
    // }catch(e){
    //   log(e.toString() , name: 'SwitchAccountBloc');
    //   emit(SwitchAccountErrorState(message: ErrorConstants.errorMessage));
    // }
  }
}
