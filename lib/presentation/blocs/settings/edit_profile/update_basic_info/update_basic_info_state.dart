part of 'update_basic_info_bloc.dart';

@immutable
sealed class UpdateBasicInfoState {}

class UpdateBasicInfoInitialState extends UpdateBasicInfoState {}

class UpdateBasicInfoLoadingState extends UpdateBasicInfoState {}

class UpdateBasicInfoLoadedState extends UpdateBasicInfoState {}

class UpdateBasicInfoErrorState extends UpdateBasicInfoState {
  final String message;
  UpdateBasicInfoErrorState({required this.message});
}

