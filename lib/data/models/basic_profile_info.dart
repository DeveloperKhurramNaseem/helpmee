import 'dart:io';

class BasicProfileInfo {
  static const firstNameKey = 'first_name',
      lastNameKey = 'last_name',
      genderKey = 'gender',
      heightKey = 'height',
      weightKey = 'weight',
      profileImageKey = 'profile_image';
  String firstName;
  String lastName;
  int gender;
  int height;
  int weight;
  File? profileImage;
  BasicProfileInfo({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.height,
    required this.weight,
    this.profileImage,
  });

  Map<String,dynamic> toMap(){
    return {
      firstNameKey: firstName,
      lastNameKey: lastName,
      genderKey: gender,
      heightKey: height,
      weightKey: weight,      
    };
  }
}
