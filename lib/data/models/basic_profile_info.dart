import 'dart:io';

class BasicProfileInfo {
  static const firstNameKey = 'first_name',
      lastNameKey = 'last_name',
      genderKey = 'gender',
      heightKey = 'height',
      weightKey = 'weight',
      bloodGroupKey = 'blood_group',
      profileImageKey = 'profile_image';
  String firstName;
  String lastName;
  int gender;
  int height;
  int weight;
  String bloodGroup;
  File? profileImage;
  BasicProfileInfo({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bloodGroup,
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
    };
  }
}
