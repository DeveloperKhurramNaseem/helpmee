part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackState {}

class FeedbackInitialState extends FeedbackState {}

class FeedbackLoadingState extends FeedbackState {}

class FeedbackDoneState extends FeedbackState {
  final String message;
  FeedbackDoneState({required this.message});
}


class FeedbackErrorState extends FeedbackState {
  final String message;
  FeedbackErrorState({required this.message});
}
