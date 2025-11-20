part of 'make_child_with_existing_email_bloc.dart';

@immutable
class MakeChildWithExistingEmailEvent {
  final String code;
  final String device;
  const MakeChildWithExistingEmailEvent({required this.code , required this.device});
}
