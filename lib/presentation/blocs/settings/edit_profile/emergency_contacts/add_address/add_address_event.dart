part of 'add_address_bloc.dart';

@immutable
sealed class AddAddressEvent {}

class AddNewAddressEvent extends AddAddressEvent{  
  
  final String streetName;
  final String houseNumber;
  final String city;
  final String country;
  final String name;
  
  final String zip;

  AddNewAddressEvent({    
    required this.streetName,
    required this.houseNumber,
    required this.city,
    required this.country,
    required this.name,
  
    required this.zip,
  });
}
