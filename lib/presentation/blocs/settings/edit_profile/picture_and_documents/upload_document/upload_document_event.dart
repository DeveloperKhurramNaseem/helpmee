part of 'upload_document_bloc.dart';

@immutable
sealed class UploadDocumentEvent {}

class UploadNewDocumentEvent extends UploadDocumentEvent{
  final DocumentType documentType;
  final String documentName;
  final File documentFile;
  UploadNewDocumentEvent({required this.documentType,required this.documentName,required this.documentFile});
}
