part of 'delete_document_bloc.dart';

@immutable
sealed class DeleteDocumentState {}

class DeleteDocumentInitial extends DeleteDocumentState {}

class DeleteDocumentLoading extends DeleteDocumentState {
  final int docId;
  DeleteDocumentLoading({required this.docId});
}


class DeleteDocumentLoaded extends DeleteDocumentState {}

class DeleteDocumentError extends DeleteDocumentState {
  final String message;
  DeleteDocumentError({required this.message}); 
}
