import 'package:intl/intl.dart';

class UserProfileModel {
  static const userKey = 'user',
      familyContactsKey = 'familyContacts',
      addressesKey = 'address',
      doctorContactsKey = 'doctorsContacts',
      medicationDocumentsKey = 'medicationDocuments',
      documentsKey = 'vaccinationdocuments',
      notAddedDiseaseTypesKey = 'not_added_diseases_Types',
      addedDiseaseTypesKey = 'added_diseases_Types';

  User user;
  List<Contact> familyContacts;
  List<Contact> doctorContacts;
  List<Address> addresses;
  List<Document> medicationDocuments;
  List<Document> documents;
  List<Disease> notAddedDiseaseTypes;
  List<Disease> addedDiseaseType;

  UserProfileModel({
    required this.user,
    required this.familyContacts,
    required this.doctorContacts,
    required this.addresses,
    required this.medicationDocuments,
    required this.documents,
    required this.notAddedDiseaseTypes,
    required this.addedDiseaseType,
  });

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      user: User.fromMap(map[userKey] ?? {}),
      familyContacts: (map[familyContactsKey] as List)
          .map((e) => Contact.fromMap(e))
          .toList(),
      addresses: (map[addressesKey] as List)
          .map((e) => Address.fromMap(e))
          .toList(),
      doctorContacts: (map[doctorContactsKey] as List)
          .map((e) => Contact.fromMap(e))
          .toList(),
      medicationDocuments: (map[medicationDocumentsKey] as List)
          .map((e) => Document.fromMap(e))
          .toList(),
      documents: (map[documentsKey] as List)
          .map((e) => Document.fromMap(e))
          .toList(),
      notAddedDiseaseTypes: (map[notAddedDiseaseTypesKey] as List)
          .map((e) => Disease.fromMap(e))
          .toList(),
      addedDiseaseType: (map[addedDiseaseTypesKey] as List)
          .map((e) => Disease.fromMap(e))
          .toList(),
    );
  }

  factory UserProfileModel.empty() {
    return UserProfileModel(
      user: User.fromMap({}),
      familyContacts: [],
      addresses: [],
      doctorContacts: [],
      medicationDocuments: [],
      documents: [],
      notAddedDiseaseTypes: [],
      addedDiseaseType: [],
    );
  }
}

class User {
  static const idKey = 'id',
      firstNameKey = 'first_name',
      lastNameKey = 'last_name',
      dateOfBirthKey = 'dob';
  static const genderKey = 'gender',
      heightKey = 'height',
      weightKey = 'weight',
      bloodGroupKey = 'blood_group';
  static const importantNoteKey = 'important_note',
      insuranceCompanyKey = 'insurance_company',
      insuranceIdKey = 'insurance_id';
  static const bioKey = 'bio', profileImageKey = 'profile_image';
  static const raceKey = 'race', petCharacterKey = 'pet_character';
  static const sizeKey = 'size', castratedKey = 'castrated';
  static const chippedKey = 'chipped', chipPositionKey = 'chip_position';
  static const taxNoKey = 'tax_no', tassoNoKey = 'tasso_no';
  static const specialFeaturesKey = 'special_features';

  int id;
  String firstName;
  String lastName;
  String dateOfBirth;
  int gender;
  String height;
  String weight;
  String bloodGroup;
  String importantNote;
  String insuranceCompany;
  String insuranceId;
  String bio;
  String profileImage;
  String race;
  String petCharacter;
  String size;
  String castrated;
  String chipped;
  String chipPosition;
  String taxNo;
  String tassoNo;
  String specialFeatures;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bloodGroup,
    required this.importantNote,
    required this.insuranceCompany,
    required this.insuranceId,
    required this.bio,
    required this.profileImage,
    required this.race,
    required this.petCharacter,
    required this.size,
    required this.castrated,
    required this.chipped,
    required this.chipPosition,
    required this.taxNo,
    required this.tassoNo,
    required this.specialFeatures,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    var currentDate = DateTime.now();
    return User(
      id: map[idKey] ?? 0,
      firstName: map[firstNameKey] ?? '',
      lastName: map[lastNameKey] ?? '',
      dateOfBirth:
          map[dateOfBirthKey] ??
          DateFormat('yyyy-mm-dd hh:mm:ss').format(currentDate),
      gender: map[genderKey] ?? 1,
      height: map[heightKey] ?? '',
      weight: map[weightKey] ?? '',
      bloodGroup: map[bloodGroupKey] ?? 'A+',
      importantNote: map[importantNoteKey] ?? '',
      insuranceCompany: map[insuranceCompanyKey] ?? '',
      insuranceId: map[insuranceIdKey] ?? '',
      bio: map[bioKey] ?? '',
      profileImage: map[profileImageKey] ?? '',
      race: map[raceKey] ?? '',
      petCharacter: map[petCharacterKey] ?? '',
      size: map[sizeKey] ?? '',
      castrated: ((map[castratedKey] ?? '') as String).toLowerCase(),
      chipped: ((map[chippedKey] ?? '') as String).toLowerCase(),
      chipPosition: map[chipPositionKey] ?? '',
      taxNo: map[taxNoKey] ?? '',
      tassoNo: map[tassoNoKey] ?? '',
      specialFeatures: map[specialFeaturesKey] ?? '',
    );
  }
  factory User.empty(){
    return User(
      id: 0,
      firstName: '',
      lastName: '',
      dateOfBirth: '',
      gender: 1,
      height: '',
      weight: '',
      bloodGroup: 'A+',
      importantNote: '',
      insuranceCompany: '',
      insuranceId: '',
      bio: '',
      profileImage: '',
      race: '',
      petCharacter: '',
      size: '',
      castrated: '',
      chipped: '',
      chipPosition: '',
      taxNo: '',  
      tassoNo: '',
      specialFeatures: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      idKey: id,
      firstNameKey: firstName,
      lastNameKey: lastName,
      dateOfBirthKey: dateOfBirth,
      genderKey: gender,
      heightKey: height,
      weightKey: weight,
      bloodGroupKey: bloodGroup,
      importantNoteKey: importantNote,
      insuranceCompanyKey: insuranceCompany,
      insuranceIdKey: insuranceId,
      bioKey: bio,
      profileImageKey: profileImage,
      raceKey: race,
      petCharacterKey: petCharacter,
      sizeKey: size,
      castratedKey: castrated,
      chippedKey: chipped,
      chipPositionKey: chipPosition,
      taxNoKey: taxNo,
      tassoNoKey: tassoNo,
      specialFeaturesKey: specialFeatures,
    };
  }
}

class Contact {
  static const idKey = 'id',
      nameKey = 'name',
      userIdKey = 'user_id',
      typeKey = 'type',
      phoneNoKey = 'phone_no',
      whatsappNoKey = 'whatsapp_no',
      createdAtKey = 'created_at',
      updatedAtKey = 'updated_at';

  int id;
  String name;
  int userId;
  String type;
  String phoneNo;
  String whatsappNo;
  String createdAt;
  String updatedAt;

  Contact({
    required this.id,
    required this.name,
    required this.userId,
    required this.type,
    required this.phoneNo,
    required this.whatsappNo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map[idKey] ?? 0,
      name: map[nameKey] ?? '',
      userId: map[userIdKey] ?? 0,
      type: map[typeKey] ?? '',
      phoneNo: map[phoneNoKey] ?? '',
      whatsappNo: map[whatsappNoKey] ?? '',
      createdAt: map[createdAtKey] ?? '',
      updatedAt: map[updatedAtKey] ?? '',
    );
  }
}

class DoctorContact {}

class Address {
  static const idKey = 'id',
      nameKey = 'name',
      streetNameKey = 'street_name',
      houseNumberKey = 'house_number',
      zipKey = 'zip',
      cityKey = 'city',
      countryKey = 'country',
      descriptionKey = 'description',
      codeKey = 'code',
      createdAtKey = 'created_at',
      updatedAtKey = 'updated_at';

  int id;
  String name;
  String streetName;
  String houseNumber;
  String zip;
  String city;
  String country;
  String description;
  String code;
  String createdAt;
  String updatedAt;

  Address({
    required this.id,
    required this.name,
    required this.streetName,
    required this.houseNumber,
    required this.zip,
    required this.city,
    required this.country,
    required this.description,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map[idKey] ?? 0,
      name: map[nameKey] ?? '',
      streetName: map[streetNameKey] ?? '',
      houseNumber: map[houseNumberKey] ?? '',
      zip: map[zipKey] ?? '',
      city: map[cityKey] ?? '',
      country: map[countryKey] ?? '',
      description: map[descriptionKey] ?? '',
      code: map[codeKey] ?? '',
      createdAt: map[createdAtKey] ?? '',
      updatedAt: map[updatedAtKey] ?? '',
    );
  }
}

class Document {
  static const idKey = 'id',
      userIdKey = 'user_id',
      typeKey = 'type',
      nameKey = 'name',
      imageKey = 'image',
      statusKey = 'status',
      createdAtKey = 'created_at',
      updatedAtKey = 'updated_at',
      imageExtensionKey = 'image_extension';

  int id;
  int userId;
  String type;
  String name;
  String image;
  String status;
  String createdAt;
  String updatedAt;
  String imageExtension;

  Document({
    required this.id,
    required this.userId,
    required this.type,
    required this.name,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.imageExtension,
  });

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      id: map[idKey] ?? 0,
      userId: map[userIdKey] ?? 0,
      type: map[typeKey] ?? '',
      name: map[nameKey] ?? '',
      image: map[imageKey] ?? '',
      status: map[statusKey] ?? '',
      createdAt: map[createdAtKey] ?? '',
      updatedAt: map[updatedAtKey] ?? '',
      imageExtension: map[imageExtensionKey] ?? '',
    );
  }
}

class VaccinationDocuments {}

class Disease {
  static const idKey = 'id',
      nameKey = 'name',
      typeKey = 'type',
      diseaseDetailsKey = 'disease_Details';

  int id;
  String name;
  String type;
  DiseaseDetails diseaseDetails;

  Disease({
    required this.id,
    required this.name,
    required this.type,
    required this.diseaseDetails,
  });

  factory Disease.fromMap(Map<String, dynamic> map) {
    return Disease(
      id: map[idKey] ?? 0,
      name: map[nameKey] ?? '',
      type: map[typeKey] ?? '',
      diseaseDetails: DiseaseDetails.fromMap(map[diseaseDetailsKey] ?? {}),
    );
  }
}

class DiseaseDetails {
  static const idKey = 'id',
      diseaseIdKey = 'disease_id',
      userIdKey = 'user_id',
      detailsKey = 'details',
      medicationsKey = 'medications',
      statusKey = 'status',
      isCheckKey = 'is_check';

  int id;
  int diseaseId;
  int userId;
  String details;
  String medications;
  String status;
  String isCheck;

  DiseaseDetails({
    required this.id,
    required this.diseaseId,
    required this.userId,
    required this.details,
    required this.medications,
    required this.status,
    required this.isCheck,
  });

  factory DiseaseDetails.fromMap(Map<String, dynamic> map) {
    return DiseaseDetails(
      id: map[idKey] ?? 0,
      diseaseId: map[diseaseIdKey] ?? 0,
      userId: map[userIdKey] ?? 0,
      details: map[detailsKey] ?? '',
      medications: map[medicationsKey] ?? '',
      status: map[statusKey] ?? '',
      isCheck: map[isCheckKey] ?? '',
    );
  }
}
