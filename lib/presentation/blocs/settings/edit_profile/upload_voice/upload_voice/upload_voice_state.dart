part of 'upload_voice_bloc.dart';

@immutable
sealed class UploadVoiceState {}

class UploadVoiceInitialState extends UploadVoiceState {}

class UploadVoiceLoadingState extends UploadVoiceState {}


class UploadVoiceLoadedState extends UploadVoiceState {}

class UploadVoiceErrorState extends UploadVoiceState {
  final String message;
  UploadVoiceErrorState({required this.message});
}
