part of 'lock_document_bloc.dart';

@immutable
sealed class LockDocumentState {}

class LockDocumentInitial extends LockDocumentState {}

class LockDocumentLoading extends LockDocumentState {
  final int docId;
  LockDocumentLoading({required this.docId});
}

class LockDocumentLoaded extends LockDocumentState {}

class LockDocumentError extends LockDocumentState {
  final String message;
  LockDocumentError({required this.message});
}
