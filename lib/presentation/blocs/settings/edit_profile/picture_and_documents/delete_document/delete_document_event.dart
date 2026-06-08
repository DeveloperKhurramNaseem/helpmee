part of 'delete_document_bloc.dart';

@immutable
sealed class DeleteDocumentEvent {}

class DeleteCurrentDocumentEvent extends DeleteDocumentEvent {
  final int docId;  
  DeleteCurrentDocumentEvent(this.docId);
}
