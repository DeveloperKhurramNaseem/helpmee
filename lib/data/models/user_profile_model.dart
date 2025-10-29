class UserProfileModel {
  static const userKey = 'user',
      familyContactsKey = 'familyContacts',
      addressesKey = 'address',
      doctorContactsKey = 'doctorsContacts';

  User user;
  List<Contact> familyContacts;
  List<Contact> doctorContacts;
  List<Address> addresses;

  UserProfileModel({
    required this.user,
    required this.familyContacts,
    required this.doctorContacts,
    required this.addresses,
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
    );
  }

  factory UserProfileModel.empty() {
    return UserProfileModel(
      user: User.fromMap({}),
      familyContacts: [],
      addresses: [],
      doctorContacts: [],
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
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map[idKey] ?? 0,
      firstName: map[firstNameKey] ?? '',
      lastName: map[lastNameKey] ?? '',
      dateOfBirth: map[dateOfBirthKey] ?? '',
      gender: map[genderKey] ?? 0,
      height: map[heightKey] ?? '',
      weight: map[weightKey] ?? '',
      bloodGroup: map[bloodGroupKey] ?? '',
      importantNote: map[importantNoteKey] ?? '',
      insuranceCompany: map[insuranceCompanyKey] ?? '',
      insuranceId: map[insuranceIdKey] ?? '',
      bio: map[bioKey] ?? '',
      profileImage: map[profileImageKey] ?? '',
    );
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

class MedicationDocuments {}

class VaccinationDocuments {}

class DiseaseType {}
