import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'restore_product_event.dart';
part 'restore_product_state.dart';

class RestoreProductBloc
    extends Bloc<RestoreProductEvent, RestoreProductState> {
  final UserRepo userRepo;
  RestoreProductBloc(this.userRepo) : super(RestoreProductInitialState()) {
    on<RestoreThisProductEvent>(_handleRestoreProductEvent);
  }

  FutureOr<void> _handleRestoreProductEvent(RestoreThisProductEvent event, Emitter<RestoreProductState> emit) async{
    try{
      emit(RestoreProductLoadingState());
      var result = await userRepo.restoreProduct(event.code);
      if(result.$1){
        emit(RestoreProductDoneState(result.$2));
      }else{
        emit(RestoreProductErrorState(result.$2));
      }
    }catch(e){
      log(e.toString() , name: 'RestoreProductBloc');
      emit(RestoreProductErrorState(ErrorConstants.errorMessage));
    }

  }
}
