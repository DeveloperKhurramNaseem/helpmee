part of 'upload_document_bloc.dart';

@immutable
sealed class UploadDocumentState {}

class UploadDocumentInitialState extends UploadDocumentState {}

class UploadDocumentLoading extends UploadDocumentState {}

class UploadDocumentLoaded extends UploadDocumentState {}

class UploadDocumentError extends UploadDocumentState {
  final String message;

  UploadDocumentError({required this.message});
}

class UploadDocumentDialogError extends UploadDocumentState {
  final String message;

  UploadDocumentDialogError({required this.message});
}
