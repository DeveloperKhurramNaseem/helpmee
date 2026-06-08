import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'lock_document_event.dart';
part 'lock_document_state.dart';

class LockDocumentBloc extends Bloc<LockDocumentEvent, LockDocumentState> {
  final UserProfileRepo userProfileRepo;
  LockDocumentBloc(this.userProfileRepo) : super(LockDocumentInitial()) {
    on<LockCurrentDocumentEvent>(_handleLockCurrentDocument);
  }

  FutureOr<void> _handleLockCurrentDocument(
    LockCurrentDocumentEvent event,
    Emitter<LockDocumentState> emit,
  ) async {
    try {
      emit(LockDocumentLoading(docId: event.docId));
      var result = await userProfileRepo.lockDocument(
        event.docId,
        event.status,
      );
      if (result.$1) {
        emit(LockDocumentLoaded());
      } else {
        emit(LockDocumentError(message: result.$2));
      } 
    } catch (e) {
      log(e.toString(), name: 'LockDocumentBloc');
      emit(LockDocumentError(message: ErrorConstants.errorMessage));
    }
  }
}
