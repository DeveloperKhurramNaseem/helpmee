import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'delete_document_event.dart';
part 'delete_document_state.dart';

class DeleteDocumentBloc extends Bloc<DeleteDocumentEvent, DeleteDocumentState> {
  final UserProfileRepo userProfileRepo;
  DeleteDocumentBloc(this.userProfileRepo) : super(DeleteDocumentInitial()) {
    on<DeleteCurrentDocumentEvent>(_handleDeleteDocumentEvent);
  }

  FutureOr<void> _handleDeleteDocumentEvent(DeleteCurrentDocumentEvent event, Emitter<DeleteDocumentState> emit) async{
    try{
      emit(DeleteDocumentLoading(docId: event.docId));
      var result = await userProfileRepo.deleteDocument(event.docId);
      if(result.$1){
        emit(DeleteDocumentLoaded());
      }else{
        emit(DeleteDocumentError(message: result.$2));
      }
    }catch(e){
      log(e.toString() , name: 'DeleteDocumentBloc');
      emit(DeleteDocumentError(message: ErrorConstants.errorMessage));
    }
  }
}
