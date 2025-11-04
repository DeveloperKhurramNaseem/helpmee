import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/upload_document_sheet.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'upload_document_event.dart';
part 'upload_document_state.dart';

class UploadDocumentBloc
    extends Bloc<UploadDocumentEvent, UploadDocumentState> {
  final UserProfileRepo userProfileRepo;
  UploadDocumentBloc(this.userProfileRepo) : super(UploadDocumentInitialState()) {
    on<UploadNewDocumentEvent>(_handleUploadNewDocumentEvent);
  }

  FutureOr<void> _handleUploadNewDocumentEvent(
    UploadNewDocumentEvent event,
    Emitter<UploadDocumentState> emit,
  ) async {
    try {
      emit(UploadDocumentLoading());
      (bool, String) result;
      if (event.documentType == DocumentType.simple) {
        result = await userProfileRepo.uploadSimpleDocument(
          event.documentName,
          event.documentFile,
        );
      } else {
        result = await userProfileRepo.uploadMedicationDocument(
          event.documentName,
          event.documentFile,
        );
      }
      if(result.$1){
        emit(UploadDocumentLoaded());
      }
      else{
        emit(UploadDocumentError(message:result.$2));
      }
    } catch (e) {
      log(e.toString(), name: 'UploadDocumentBloc');
      emit(UploadDocumentError(message: ErrorConstants.errorMessage));
    }
  }
}
