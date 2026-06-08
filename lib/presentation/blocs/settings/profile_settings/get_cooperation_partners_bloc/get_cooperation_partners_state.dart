part of 'get_cooperation_partners_bloc.dart';

@immutable
sealed class GetCooperationPartnersState {}

class GetCooperationPartnersInitialState extends GetCooperationPartnersState {}

class GetCooperationPartnersLoadingState extends GetCooperationPartnersState {}


class GetCooperationPartnersDoneState extends GetCooperationPartnersState {
  final List<CooperationPartner> cooperationPartners;

  GetCooperationPartnersDoneState({required this.cooperationPartners});
}


class GetCooperationPartnersErrorState extends GetCooperationPartnersState {
  final String message;

  GetCooperationPartnersErrorState({required this.message});
}
