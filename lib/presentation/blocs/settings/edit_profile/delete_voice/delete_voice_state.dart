part of 'delete_voice_bloc.dart';

@immutable
sealed class DeleteVoiceState {}

class DeleteVoiceInitialState extends DeleteVoiceState {}

class DeleteVoiceLoadingState extends DeleteVoiceState {}


class DeleteVoiceDoneState extends DeleteVoiceState {}


class DeleteVoiceErrorState extends DeleteVoiceState {
  final String message;

  DeleteVoiceErrorState(this.message);
}
