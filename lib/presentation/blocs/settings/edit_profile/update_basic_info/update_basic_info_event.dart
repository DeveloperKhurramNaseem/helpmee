part of 'update_basic_info_bloc.dart';

@immutable
sealed class UpdateBasicInfoEvent {}

class UpdateBasicProfileInfoEvent extends UpdateBasicInfoEvent{
  final String firstName , lastName;
  final int gender;
  final double height;
  final double weight;
  final String bio;
  final String dob;
  final String bloodGroup;  
  final File? imageFile;
  final String insuranceCompany;  
  final String insuranceId;

  UpdateBasicProfileInfoEvent({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.bio,
    required this.height,
    required this.weight, 
    required this.bloodGroup,   
    required this.dob,
    required this.imageFile,
    required this.insuranceCompany,
    required this.insuranceId
  });
}


class UpdateBasicPetProfileInfoEvent extends UpdateBasicInfoEvent{
  final String name , race;  
  final String chipped , chipPosition;
  final String taxNo , tassoNo;
  final String insuranceCompany , insuranceId;
  final String specialFeatures;
  final String castrated , bloodGroup , bio;
  final String dateOfBirth;
  final int gender;
  final File? imageFile;
  final String character;
  final String size , weight;

  UpdateBasicPetProfileInfoEvent({
    required this.name,
    required this.race,    
    required this.chipped,
    required this.imageFile,
    required this.chipPosition,
    required this.taxNo,
    required this.tassoNo,
    required this.insuranceCompany,
    required this.insuranceId,
    required this.specialFeatures,
    required this.castrated,
    required this.bloodGroup,
    required this.dateOfBirth,
    required this.gender,
    required this.size,
    required this.weight,
    required this.bio,
    required this.character

  });
}
