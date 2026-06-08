part of 'update_cooperation_partner_status_bloc.dart';


class UpdateCooperationPartnerStatusEvent {}


class UpdateCurrentCooperationPartnerStatusEvent extends UpdateCooperationPartnerStatusEvent {
  final int id;
  final String isActive;

  UpdateCurrentCooperationPartnerStatusEvent({
    required this.id,
    required this.isActive,
  });
}
