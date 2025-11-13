import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'transfer_data_event.dart';
part 'transfer_data_state.dart';

class TransferDataBloc extends Bloc<TransferDataEvent, TransferDataState> {

  final UserRepo userRepo;
  TransferDataBloc(this.userRepo) : super(TransferDataInitialState()) {
    on<TransferDataEvent>(_handleTransferDataEvent);
  }

  FutureOr<void> _handleTransferDataEvent(
    TransferDataEvent event,
    Emitter<TransferDataState> emit,
  ) async {
    try{
      emit(TransferDataLoadingState());
      var result = await userRepo.transferData(event.userName);
      if(result.$1){
        emit(TransferDataLoadedState());
      }else{
        emit(TransferDataErrorState(message: result.$2));
      }      
    }catch(e){
      log(e.toString());
      emit(TransferDataErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
