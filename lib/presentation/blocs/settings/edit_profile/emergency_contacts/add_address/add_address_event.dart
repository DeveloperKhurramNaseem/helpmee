part of 'add_address_bloc.dart';

@immutable
sealed class AddAddressEvent {}

class AddNewAddressEvent extends AddAddressEvent{
  final int addressId;
  final String name;
  final String streetName;
  final String houseNumber;
  final String city;
  final String country;
  final String description;
  final String code;
  final String zip;

  AddNewAddressEvent({
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
