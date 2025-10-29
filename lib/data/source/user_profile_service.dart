import 'package:help_mee/data/models/basic_profile_info.dart';
import 'package:help_mee/data/models/requests/address_info.dart';
import 'package:help_mee/data/models/requests/contact_info.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/services/api_services/api_service.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:help_mee/util/network/end_points.dart';
import 'package:help_mee/util/network/network_constants.dart';

class UserProfileService extends ApiService {
  @override
  String get apiUrl => '/api/v3/users';

  Future<(bool, String, UserProfileModel)> getUserProfileData(
    String token,
    String language,
  ) async {
    var result = await get(
      endPoint: EndPoints.getUserProfile,
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        decodedResponse.message,
        UserProfileModel.fromMap(decodedResponse.data),
      );
    } else {
      return (false, ErrorConstants.errorMessage, UserProfileModel.empty());
    }
  }

  Future<(bool, String)> updateBasicUserInfo(
    String token,
    String language,
    BasicProfileInfo info,
  ) async {
    String? result;
    if (info.profileImage != null) {
      result = await postWithFile(
        EndPoints.updateBasicProfileInfo,
        info.toMap(),
        'profile_image',
        info.profileImage!,
        header: NetworkConstants.getHeaders(language, token),
      );
    } else {
      result = await post(
        EndPoints.updateBasicProfileInfo,
        info.toMap(),
        header: NetworkConstants.getHeaders(language, token),
      );
    }
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool, String)> addFamilyContact(
    String token,
    String language,
    ContactInfo contactInfo,
  ) async {
    var result = await post(
      EndPoints.addFamilyContact,
      contactInfo.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    } else {
      return (false, ErrorConstants.errorMessage);
    }
  }

  Future<(bool, String)> addDoctorContact(
    String token,
    String language,
    ContactInfo contactInfo,
  ) async {
    var result = await post(
      EndPoints.addDoctorContact,
      contactInfo.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    } else {
      return (false, ErrorConstants.errorMessage);
    }
  }

  Future<(bool, String)> deleteContact(
    String token,
    String language,
    int contactId,
  ) async {
    var result = await delete(
      '${EndPoints.deleteContact}/$contactId',
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    } else {
      return (false, ErrorConstants.errorMessage);
    }
  }

  Future<(bool, String)> updateContact(
    String token,
    String language,
    int contactId,
    ContactInfo contactInfo,
  ) async {
    var result = await post(
      '${EndPoints.updateContact}/$contactId',
      contactInfo.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    } else {
      return (false, ErrorConstants.errorMessage);
    }
  }

  Future<(bool, String)> addAddress(
    String token,
    String language,
    AddressInfo addressInfo,
  ) async {
    var result = await post(
      EndPoints.addAddress,
      addressInfo.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    } else {
      return (false, ErrorConstants.errorMessage);
    }
  }

   Future<(bool, String)> deleteAddress(
    String token,
    String language,
    int addressId,
  ) async {
    var result = await delete(
      '${EndPoints.deleteAddress}/$addressId',
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    } else {
      return (false, ErrorConstants.errorMessage);
    }
  }

  Future<(bool,String)> updateAddress(String token, String language, int addressId, AddressInfo addressInfo) async {
    var result = await put(
      '${EndPoints.updateAddress}/$addressId',
      addressInfo.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    } else {
      return (false, ErrorConstants.errorMessage);
    }
  }
}
