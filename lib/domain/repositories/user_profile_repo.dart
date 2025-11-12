import 'dart:io';

import 'package:help_mee/data/models/basic_profile_info.dart';
import 'package:help_mee/data/models/requests/address_info.dart';
import 'package:help_mee/data/models/requests/contact_info.dart';
import 'package:help_mee/data/models/requests/disease_info.dart';
import 'package:help_mee/data/models/user_profile_model.dart';

abstract class UserProfileRepo {
  Future<(bool,String ,UserProfileModel)> getUserProfile();
  Future<(bool,String ,UserProfileModel)> getPetUserProfile();
  Future<(bool,String)> updateBasicProfileInfo(BasicProfileInfo info);
  Future<(bool,String)> updateBasicPetProfileInfo(BasicPetProfileInfo info);
  Future<(bool,String)> addFamilyContact(ContactInfo contactInfo);
  Future<(bool,String)> addDoctorContact(ContactInfo contactInfo);
  Future<(bool, String)> deleteContact(int contactId);
  Future<(bool, String)> updateContact(int contactId,ContactInfo contactInfo);
  Future<(bool,String)> addAddress(AddressInfo addressInfo);
  Future<(bool, String)> deleteAddress(int addressId);
  Future<(bool, String)> updateAddress(int addressId,AddressInfo addressInfo);
  Future<(bool,String)> addDisease(DiseaseInfo diseaseInfo);
  Future<(bool,String)> deleteDisease(int diseaseId);
  Future<(bool,String)> lockDisease(int diseaseId,String status);
  Future<(bool,String)> uploadSimpleDocument(String fileName , File file);
  Future<(bool,String)> uploadMedicationDocument(String fileName , File file);
  Future<(bool,String)> deleteDocument(int docId);
  Future<(bool,String)> lockDocument(int docId,String status);
  Future<(bool,String)> uploadVoice(File voiceFile);    

}