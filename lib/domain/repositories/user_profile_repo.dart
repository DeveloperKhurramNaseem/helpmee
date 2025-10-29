import 'package:help_mee/data/models/basic_profile_info.dart';
import 'package:help_mee/data/models/requests/address_info.dart';
import 'package:help_mee/data/models/requests/contact_info.dart';
import 'package:help_mee/data/models/user_profile_model.dart';

abstract class UserProfileRepo {
  Future<(bool,String ,UserProfileModel)> getUserProfile();
  Future<(bool,String)> updateBasicProfileInfo(BasicProfileInfo info);
  Future<(bool,String)> addFamilyContact(ContactInfo contactInfo);
  Future<(bool,String)> addDoctorContact(ContactInfo contactInfo);
  Future<(bool, String)> deleteContact(int contactId);
  Future<(bool, String)> updateContact(int contactId,ContactInfo contactInfo);
  Future<(bool,String)> addAddress(AddressInfo addressInfo);
  Future<(bool, String)> deleteAddress(int addressId);
  Future<(bool, String)> updateAddress(int addressId,AddressInfo addressInfo);
}