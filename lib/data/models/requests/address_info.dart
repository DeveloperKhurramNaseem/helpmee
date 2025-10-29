class AddressInfo {

  static const nameKey = 'name' , streetNameKey = 'street_name' , houseNumberKey = 'house_number' , cityKey = 'city' , countryKey = 'country' , descriptionKey = 'description' , codeKey = 'code' , zipKey = 'zip' ;

  String name;
  String streetName;
  String houseNumber;
  String city;
  String country;
  String description;
  String code;
  String zip;

  AddressInfo({
    required this.name,
    required this.streetName,
    required this.houseNumber,
    required this.city,
    required this.country,
    required this.description,
    required this.code,
    required this.zip,
  });


  Map<String,dynamic> toMap(){
    return {
      nameKey: name,
      streetNameKey: streetName,
      houseNumberKey: houseNumber,
      cityKey: city,
      countryKey: country,
      descriptionKey: description,
      codeKey: code,
      zipKey: zip,
    };
  }

}