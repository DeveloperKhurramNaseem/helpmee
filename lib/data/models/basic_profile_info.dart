import 'dart:io';

class BasicProfileInfo {
  static const firstNameKey = 'first_name',
      lastNameKey = 'last_name',
      genderKey = 'gender',
      heightKey = 'height',
      weightKey = 'weight',
      bioKey = 'bio',
      bloodGroupKey = 'blood_group',
      insuranceCompanyKey = 'insurance_company',
      insuranceIdKey = 'insurance_id',
      profileImageKey = 'profile_image';
  String firstName;
  String lastName;
  int gender;
  int height;
  String bio;
  int weight;
  String bloodGroup;
  String insuranceCompany;
  String insuranceId;
  File? profileImage;
  BasicProfileInfo({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bio,
    required this.bloodGroup,
    required this.insuranceCompany,
    required this.insuranceId ,
    this.profileImage,
  });

  Map<String,dynamic> toMap(){
    return {
      firstNameKey: firstName,
      lastNameKey: lastName,
      genderKey: gender,
      heightKey: height,
      weightKey: weight,      
      bioKey: bio,
      bloodGroupKey : bloodGroup,
      insuranceCompanyKey : insuranceCompany,
      insuranceIdKey : insuranceId,
    };
  }
}



class BasicPetProfileInfo {
  static const nameKey = 'first_name',
  raceKey = 'race',
      characterKey = 'pet_character',
      sizeKey = 'size',
      castratedKey = 'castrated',
      dateOfBirthKey = 'dob',
      chippedKey = 'chipped',
      chipPositionKey = 'chip_position',
      taxNoKey = 'tax_no',
      tassoNoKey = 'tasso_no',
      specialFeatureKey = 'special_features',      
      genderKey = 'gender',      
      weightKey = 'weight',
      bloodGroupKey = 'blood_group',
      insuranceCompanyKey = 'insurance_company',
      insuranceIdKey = 'insurance_id',
      bioKey = 'bio',
      profileImageKey = 'profile_image';
  String name;  
  String race;  
  int gender;
  String character;
  String bloodGroup;  
  String size;
  String weight;  
  String castrated;
  String dateOfBirth;
  String insuranceCompany;
  String insuranceId;
  String chipped;
  String bio;
  String chipPosition;
  String taxNo;
  String tassoNo;
  String specialFeature;
  File? profileImage;
  BasicPetProfileInfo({
    required this.name,
    required this.race,
    required this.gender,
    required this.character,
    required this.bloodGroup,
    required this.size,
    required this.bio,
    required this.weight,
    required this.castrated,
    required this.dateOfBirth,
    required this.insuranceCompany,
    required this.insuranceId,
    required this.chipped,
    required this.chipPosition,
    required this.taxNo,
    required this.tassoNo,
    required this.specialFeature,
    this.profileImage,
  });

  Map<String,dynamic> toMap(){
    return {
      nameKey: name,
      raceKey: race,
      genderKey: gender,
      characterKey: character,
      bloodGroupKey : bloodGroup,
      sizeKey : size,
      weightKey : weight,
      castratedKey : castrated,
      bioKey : bio,
      // dateOfBirthKey : dateOfBirth,
      insuranceCompanyKey : insuranceCompany,
      insuranceIdKey : insuranceId,
      chippedKey : chipped,
      chipPositionKey : chipPosition,
      taxNoKey : taxNo,
      tassoNoKey : tassoNo,
      specialFeatureKey : specialFeature          
    };
  }
}
