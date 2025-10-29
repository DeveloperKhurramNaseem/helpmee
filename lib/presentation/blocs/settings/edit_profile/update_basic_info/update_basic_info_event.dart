part of 'update_basic_info_bloc.dart';

@immutable
sealed class UpdateBasicInfoEvent {}

class UpdateBasicProfileInfoEvent extends UpdateBasicInfoEvent{
  final String firstName , lastName;
  final int gender;
  final int height;
  final int weight;  
  UpdateBasicProfileInfoEvent({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.height,
    required this.weight,    
  });
}
