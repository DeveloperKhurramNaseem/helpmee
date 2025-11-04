part of 'lock_document_bloc.dart';

@immutable
sealed class LockDocumentEvent {}

class LockCurrentDocumentEvent extends LockDocumentEvent{
  final int docId;
  final String status;
  LockCurrentDocumentEvent(this.docId ,this.status);
}
