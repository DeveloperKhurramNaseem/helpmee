part of 'upload_voice_bloc.dart';

@immutable
sealed class UploadVoiceEvent {}

class UploadVoiceNoteEvent extends UploadVoiceEvent{
  final File file;

  UploadVoiceNoteEvent({required this.file});
}
