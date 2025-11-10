part of 'update_cooperation_partner_status_bloc.dart';

@immutable
sealed class UpdateCooperationPartnerStatusState {}

class UpdateCooperationPartnerStatusInitialState extends UpdateCooperationPartnerStatusState {}

class UpdateCooperationPartnerStatusLoadingState extends UpdateCooperationPartnerStatusState {}


class UpdateCooperationPartnerStatusLoadedState extends UpdateCooperationPartnerStatusState {
  final String message;

  UpdateCooperationPartnerStatusLoadedState(this.message);
}


class UpdateCooperationPartnerStatusErrorState extends UpdateCooperationPartnerStatusState {
  final String message;

  UpdateCooperationPartnerStatusErrorState(this.message);
}
