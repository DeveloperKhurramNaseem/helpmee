import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'unmap_product_event.dart';
part 'unmap_product_state.dart';

class UnmapProductBloc extends Bloc<UnmapProductEvent, UnmapProductState> {
  final UserRepo userRepo;
  UnmapProductBloc(this.userRepo) : super(UnmapProductInitialState()) {
    on<UnmapCurrentProduct>(_handleUnmapProductEvent);
  }

  FutureOr<void> _handleUnmapProductEvent(
    UnmapCurrentProduct event,
    Emitter<UnmapProductState> emit,
  ) async {
    try{
      emit(UnmapProductLoadingState());
      var result = await userRepo.unmapProduct(event.productId);
      if(result.$1){
        emit(UnmapProductDoneState(message: result.$2));
      }else{
        emit(UnmapProductErrorState(message: result.$2));
      }
    }catch(e){
      log(e.toString());
      emit(UnmapProductErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
