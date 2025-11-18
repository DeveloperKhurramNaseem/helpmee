import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final UserRepo userRepo;
  AddProductBloc(this.userRepo) : super(AddProductInitialState()) {
    on<AddNewProductEvent>(_handleAddNewProductEvent);
  }

  FutureOr<void> _handleAddNewProductEvent(
    AddNewProductEvent event,
    Emitter<AddProductState> emit,
  ) async {
     try{
      emit(AddProductLoadingState());
      var result = await userRepo.addProduct(event.code , event.device,);
      if(result.$1){
        emit(AddProductDoneState(device: event.device));
      }else{
        emit(AddProductErrorState(message: result.$2));
      }
    }catch(e){
      emit(AddProductErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
