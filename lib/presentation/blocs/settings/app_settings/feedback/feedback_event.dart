part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackEvent {}

class SendFeedbackEvent extends FeedbackEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNo;
  final String subject;
  final String message;  

  SendFeedbackEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.subject,
    required this.message,    
  });
}
