part of 'update_address_bloc.dart';

@immutable
sealed class UpdateAddressEvent {}

class UpdateCurrentAddressEvent extends UpdateAddressEvent{
  final int addressId;
  final String name;
  final String streetName;
  final String houseNumber;
  final String city;
  final String country;
  final String description;
  final String code;
  final String zip;

  UpdateCurrentAddressEvent({
    required this.addressId,
    required this.name,
    required this.streetName,
    required this.houseNumber,
    required this.city,
    required this.country,
    required this.description,
    required this.code,
    required this.zip,
  });
}

