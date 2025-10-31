import 'package:help_mee/data/models/basic_profile_info.dart';
import 'package:help_mee/data/models/requests/address_info.dart';
import 'package:help_mee/data/models/requests/contact_info.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/data/source/user_profile_service.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';

class UserProfileRepoImpl extends UserProfileRepo{
  final UserProfileService userProfileService;
  final StorageService storageService;
  final TokenService tokenService;

  UserProfileRepoImpl(this.userProfileService, this.storageService, this.tokenService);
  @override
  Future<(bool,String, UserProfileModel)> getUserProfile() async {
    var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    var result = await userProfileService.getUserProfileData(token, language);
    return result;
  }


  @override
  Future<(bool, String)> updateBasicProfileInfo(BasicProfileInfo info) async {
    var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    var result = await userProfileService.updateBasicUserInfo(token, language , info);
    return result;
  }

  @override
  Future<(bool, String)> addFamilyContact(ContactInfo contactInfo) async {
        var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    var result = await userProfileService.addFamilyContact(token, language, contactInfo);
    return result;
  }


  @override
  Future<(bool, String)> addDoctorContact(ContactInfo contactInfo) async {
        var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    var result = await userProfileService.addDoctorContact(token, language, contactInfo);
    return result;
  }

  @override
  Future<(bool, String)> deleteContact(int contactId) async {
        var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    var result = await userProfileService.deleteContact(token, language, contactId);
    return result;
  }

  @override
  Future<(bool, String)> updateContact(int contactId, ContactInfo contactInfo) async {
        var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    var result = await userProfileService.updateContact(token, language, contactId , contactInfo);
    return result;            
  }

  @override
  Future<(bool, String)> addAddress(AddressInfo addressInfo) async {
        var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    var result = await userProfileService.addAddress(token, language, addressInfo);
    return result;            
  }

   @override
  Future<(bool, String)> deleteAddress(int addressId) async {
        var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    var result = await userProfileService.deleteAddress(token, language, addressId);
    return result;
  }

  @override
  Future<(bool, String)> updateAddress(int addressId, AddressInfo addressInfo) async {
        var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    var result = await userProfileService.updateAddress(token, language, addressId , addressInfo);
    return result;
  }




}