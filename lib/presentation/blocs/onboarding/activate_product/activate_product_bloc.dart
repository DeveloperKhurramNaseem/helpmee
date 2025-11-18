import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'activate_product_event.dart';
part 'activate_product_state.dart';

class ActivateProductBloc
    extends Bloc<ActivateProductEvent, ActivateProductState> {
      final UserRepo userRepo;
  ActivateProductBloc(this.userRepo) : super(ActivateProductInitialState()) {
    on<ActivateNewProductEvent>(_handleActivateNewProductEvent);
  }

  FutureOr<void> _handleActivateNewProductEvent(ActivateNewProductEvent event, Emitter<ActivateProductState> emit) async{
    try{
      emit(ActivateProductLoadingState());
      var result = await userRepo.activateProduct(event.code , event.device, event.token);
      if(result.$1){
        emit(ActivateProductDoneState(device: event.device));
      }else{
        emit(ActivateProductErrorState(message: result.$2));
      }
    }catch(e){
      emit(ActivateProductErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
