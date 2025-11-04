import 'dart:io';

class BasicProfileInfo {
  static const firstNameKey = 'first_name',
      lastNameKey = 'last_name',
      genderKey = 'gender',
      heightKey = 'height',
      weightKey = 'weight',
      bloodGroupKey = 'blood_group',
      insuranceCompanyKey = 'insurance_company',
      insuranceIdKey = 'insurance_id',
      profileImageKey = 'profile_image';
  String firstName;
  String lastName;
  int gender;
  int height;
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
      bloodGroupKey : bloodGroup,
      insuranceCompanyKey : insuranceCompany,
      insuranceIdKey : insuranceId,
    };
  }
}
