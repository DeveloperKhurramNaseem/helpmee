import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'edit_name_event.dart';
part 'edit_name_state.dart';

class EditNameBloc extends Bloc<EditNameEvent, EditNameState> {
  final UserRepo userRepo;
  EditNameBloc(this.userRepo) : super(EditNameInitialState()) {
    on<EditProductNameEvent>(_handleEditProductNameEvent);
  }

  FutureOr<void> _handleEditProductNameEvent(EditProductNameEvent event, Emitter<EditNameState> emit) async{
    try{
      emit(EditNameLoadingState());
     var result = await userRepo.editProductName(event.productName, event.productId);
     if(result.$1){
      emit(EditNameLoadedState());
     }else{
      emit(EditNameErrorState(result.$2));
     }
    }catch(e){
      log(e.toString());
      emit(EditNameErrorState(ErrorConstants.errorMessage));
    }
  }
}
