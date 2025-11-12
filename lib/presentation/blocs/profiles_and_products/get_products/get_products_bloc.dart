import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/product_model.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final UserRepo userRepo;
  GetProductsBloc(this.userRepo) : super(GetProductsInitialState()) {
    on<GetAllProductsEvent>(_handleGetAllProductsEvent);
  }

  FutureOr<void> _handleGetAllProductsEvent(GetAllProductsEvent event, Emitter<GetProductsState> emit) async{
    try{
      if(event.showLoading){
        emit(GetProductsLoadingState());      
      }
      var result = await userRepo.getProductsList();
      if(result.$1){
        emit(GetProductsLoadedState(products: result.$3));
      }else{
        emit(GetProductsErrorState( message:result.$2));
      }
    }catch(e){
      log(e.toString());
      emit(GetProductsErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
