import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/get_profile_data/get_profile_data_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/location_notification_settings/get_location_notification_settings/get_location_notification_settings_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/medical_information/delete_disease/delete_disease_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/medical_information/lock_disease/lock_disease_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/picture_and_documents/delete_document/delete_document_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/picture_and_documents/lock_document/lock_document_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/picture_and_documents/upload_document/upload_document_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/update_basic_info/update_basic_info_bloc.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/image_picker_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_app_bar.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_emergency_contacts.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_image.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_important_widget.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_insurance_information.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_location_box.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_medical_information.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_medication_plan.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_pet_characterestics_box.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_pet_identification.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_pet_name_and_race.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_pictures_and_documents.dart';
import 'package:help_mee/util/constants/date_formatting.dart';
import 'package:help_mee/util/constants/profile_type_from_group_id.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  static const path = '/edit-profile-screen';
  final ProfileType profileType;
  const EditProfileScreen({super.key, required this.profileType});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController birthdayController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController importantNoteController;
  late TextEditingController insuranceCompanyController;
  late TextEditingController insuranceIdController;
  int currentGenderValue = 1;
  String currentBloodGroup = 'A+';
  bool showButton = false;
  UserProfileModel? userProfile;
  File? pickedImage;
  DateTime dateOfBirth = DateTime.now();

  late TextEditingController petNameController;
  late TextEditingController petRaceController;
  late TextEditingController chipPositionController;
  late TextEditingController taxNoController;
  late TextEditingController tassoNoController;
  late TextEditingController petInsuranceCompanyController;
  late TextEditingController petInsuranceIdInformationController;
  late TextEditingController specialFeatureController;
  late TextEditingController petSizeController;
  late TextEditingController petWeightController;
  late TextEditingController characterController;
  late TextEditingController bloodGroupController;
  late TextEditingController petDateOfBirthController;
  int petGenderValue = 1;

  String castrated = 'yes';
  String chipped = 'yes';
  DateTime petBirthday = DateTime.now();

  @override
  void initState() {
    super.initState();
    var profileDataBloc = context.read<GetProfileDataBloc>();
    userProfile = profileDataBloc.userProfileModel;
    profileDataBloc.add(GetUserProfileDataSetProfileType(widget.profileType));
    profileDataBloc.add(GetUserProfileDataEvent());
    context.read<GetLocationNotificationSettingsBloc>().add(
      GetUserLocationNotificationSettingsEvent(),
    );
    firstNameController = TextEditingController()..addListener(inputListener);
    lastNameController = TextEditingController()..addListener(inputListener);
    birthdayController = TextEditingController()..addListener(inputListener);
    heightController = TextEditingController()..addListener(inputListener);
    weightController = TextEditingController()..addListener(inputListener);
    importantNoteController = TextEditingController()
      ..addListener(inputListener);
    insuranceCompanyController = TextEditingController()
      ..addListener(inputListener);
    insuranceIdController = TextEditingController()..addListener(inputListener);

    // Pet related controllers
    petNameController = TextEditingController()..addListener(inputListener);
    petRaceController = TextEditingController()..addListener(inputListener);
    chipPositionController = TextEditingController()
      ..addListener(inputListener);
    taxNoController = TextEditingController()..addListener(inputListener);
    tassoNoController = TextEditingController()..addListener(inputListener);
    petInsuranceCompanyController = TextEditingController()
      ..addListener(inputListener);
    petInsuranceIdInformationController = TextEditingController()
      ..addListener(inputListener);
    specialFeatureController = TextEditingController()
      ..addListener(inputListener);
    petSizeController = TextEditingController()..addListener(inputListener);
    petWeightController = TextEditingController()..addListener(inputListener);
    characterController = TextEditingController()..addListener(inputListener);
    bloodGroupController = TextEditingController()..addListener(inputListener);
    petDateOfBirthController = TextEditingController()
      ..addListener(inputListener);
  }

  inputListener() {
    if (userProfile != null) {
      setState(() {
        if (widget.profileType == ProfileType.pet) {
          showButton =
              petNameController.text != userProfile!.user.firstName ||
              petRaceController.text != userProfile!.user.race ||
              characterController.text != userProfile!.user.petCharacter ||
              bloodGroupController.text != userProfile!.user.bloodGroup ||
              petSizeController.text != userProfile!.user.size ||
              petWeightController.text != userProfile!.user.weight ||
              petDateOfBirthController.text !=
                  DateFormatting.formatDateForTextField(
                    DateTime.parse(userProfile!.user.dateOfBirth),
                  ) ||
              petGenderValue != userProfile!.user.gender ||
              castrated != userProfile!.user.castrated ||
              chipped != userProfile!.user.chipped ||
              chipPositionController.text != userProfile!.user.chipPosition ||
              taxNoController.text != userProfile!.user.taxNo ||
              tassoNoController.text != userProfile!.user.tassoNo ||
              petInsuranceCompanyController.text !=
                  userProfile!.user.insuranceCompany ||
              petInsuranceIdInformationController.text !=
                  userProfile!.user.insuranceId ||
              specialFeatureController.text !=
                  userProfile!.user.specialFeatures ||
              importantNoteController.text != userProfile!.user.bio;
          log(showButton.toString());
          log(userProfile!.user.toMap().toString());
        } else {
          showButton =
              firstNameController.text != userProfile!.user.firstName ||
              lastNameController.text != userProfile!.user.lastName ||
              birthdayController.text !=
                  DateFormatting.formatDateForTextField(
                    DateTime.parse(userProfile!.user.dateOfBirth),
                  ) ||
              heightController.text != userProfile!.user.height ||
              weightController.text != userProfile!.user.weight ||
              insuranceCompanyController.text !=
                  userProfile!.user.insuranceCompany ||
              insuranceIdController.text != userProfile!.user.insuranceId ||
              importantNoteController.text != userProfile!.user.bio;
        }
      });
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    birthdayController.dispose();
    heightController.dispose();
    weightController.dispose();
    importantNoteController.dispose();
    insuranceCompanyController.dispose();
    insuranceIdController.dispose();
    petNameController.dispose();
    petRaceController.dispose();
    chipPositionController.dispose();
    taxNoController.dispose();
    tassoNoController.dispose();
    petInsuranceCompanyController.dispose();
    petInsuranceIdInformationController.dispose();
    specialFeatureController.dispose();
    petSizeController.dispose();
    petWeightController.dispose();
    characterController.dispose();
    bloodGroupController.dispose();
    petDateOfBirthController.dispose();
    super.dispose();
  }

  initialzeWithData(UserProfileModel userProfile) {
    firstNameController.text = userProfile.user.firstName;
    lastNameController.text = userProfile.user.lastName;
    log('Date: ${userProfile.user.dateOfBirth}');
    birthdayController.text = DateFormatting.formatDateForTextField(
      DateTime.parse(userProfile.user.dateOfBirth),
    );
    currentGenderValue = userProfile.user.gender;
    currentBloodGroup = userProfile.user.bloodGroup;
    heightController.text = userProfile.user.height;
    weightController.text = userProfile.user.weight;
    insuranceCompanyController.text = userProfile.user.insuranceCompany;
    insuranceIdController.text = userProfile.user.insuranceId;
    importantNoteController.text = userProfile.user.bio;
  }

  initialzeWithDataForPet(UserProfileModel userProfile) {
    petNameController.text = userProfile.user.firstName;
    petRaceController.text = userProfile.user.race;
    importantNoteController.text = userProfile.user.bio;
    petBirthday = DateTime.parse(userProfile.user.dateOfBirth);
    petGenderValue = userProfile.user.gender;
    petSizeController.text = userProfile.user.size;
    castrated = userProfile.user.castrated;
    petWeightController.text = userProfile.user.weight;
    petInsuranceCompanyController.text = userProfile.user.insuranceCompany;
    petInsuranceIdInformationController.text = userProfile.user.insuranceId;
    specialFeatureController.text = userProfile.user.specialFeatures;
    taxNoController.text = userProfile.user.taxNo;
    tassoNoController.text = userProfile.user.tassoNo;
    chipPositionController.text = userProfile.user.chipPosition;
    characterController.text = userProfile.user.petCharacter;
    bloodGroupController.text = userProfile.user.bloodGroup;
    petDateOfBirthController.text = DateFormatting.formatDateForTextField(
      DateTime.parse(userProfile.user.dateOfBirth),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider<ProfileType>(
      create: (context) => widget.profileType,
      builder: (context, child) {
        return MultiBlocListener(
          listeners: [
            BlocListener<GetProfileDataBloc, GetProfileDataState>(
              listener: _handleGetProfileDataListener,
            ),
            BlocListener<UpdateBasicInfoBloc, UpdateBasicInfoState>(
              listener: _handleUpdateBasicInfoListener,
            ),
            BlocListener<DeleteDiseaseBloc, DeleteDiseaseState>(
              listener: _handleDeleteDiseaseListener,
            ),
            BlocListener<LockDiseaseBloc, LockDiseaseState>(
              listener: _handleLockDiseaseListener,
            ),
            BlocListener<UploadDocumentBloc, UploadDocumentState>(
              listener: _handleUpdateDocuemntListener,
            ),
            BlocListener<DeleteDocumentBloc, DeleteDocumentState>(
              listener: _handleDeleteDocumentListener,
            ),
            BlocListener<LockDocumentBloc, LockDocumentState>(
              listener: _handleLockDocumentListener,
            ),
          ],
          child: Scaffold(
            appBar: EpAppBar(
              showButton: showButton,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (widget.profileType == ProfileType.pet) {
                  context.read<UpdateBasicInfoBloc>().add(
                    UpdateBasicPetProfileInfoEvent(
                      name: petNameController.text.trim(),
                      race: petRaceController.text.trim(),
                      chipped: chipped,
                      imageFile: pickedImage,
                      bio: importantNoteController.text.trim(),
                      chipPosition: chipPositionController.text.trim(),
                      taxNo: taxNoController.text.trim(),
                      tassoNo: tassoNoController.text.trim(),
                      insuranceCompany: petInsuranceCompanyController.text
                          .trim(),
                      insuranceId: petInsuranceIdInformationController.text
                          .trim(),
                      specialFeatures: specialFeatureController.text.trim(),
                      castrated: castrated,
                      bloodGroup: bloodGroupController.text.trim(),
                      dateOfBirth: petDateOfBirthController.text.trim(),
                      gender: petGenderValue,
                      size: petSizeController.text.trim(),
                      weight: petWeightController.text.trim(),
                      character: characterController.text.trim(),
                    ),
                  );
                } else {
                  context.read<UpdateBasicInfoBloc>().add(
                    UpdateBasicProfileInfoEvent(
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      gender: currentGenderValue,
                      bio: importantNoteController.text.trim(),
                      height: int.tryParse(heightController.text.trim()) ?? 0,
                      weight: int.tryParse(weightController.text.trim()) ?? 0,
                      bloodGroup: currentBloodGroup,
                      imageFile: pickedImage,
                      insuranceCompany: insuranceCompanyController.text.trim(),
                      insuranceId: insuranceIdController.text.trim(),
                    ),
                  );
                }
              },
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BlocBuilder<GetProfileDataBloc, GetProfileDataState>(
                builder: (context, state) {
                  if (state is GetProfileDataLoadingState) {
                    return EditProfileLoadingWidget();
                  } else if (state is GetProfileDataLoadedState) {
                    return CustomScrollView(
                      slivers: [
                        // Header Image
                        EpHeaderImage(
                          image: userProfile!.user.profileImage,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              showDragHandle: true,
                              isScrollControlled: true,
                              builder: (context) {
                                return ImagePickerSheet(
                                  onImagePicked: (file) {
                                    pickedImage = file;
                                    Navigator.pop(context);
                                    setState(() {
                                      showButton = pickedImage != null;
                                    });
                                  },
                                );
                              },
                            );
                          },
                        ),
                        if (widget.profileType == ProfileType.pet) ...[
                          EpPetNameField(controller: petNameController),
                          EpPetRaceField(controller: petRaceController),
                        ] else ...[
                          // First name and last name
                          EpHeaderFirstAndLastName(
                            firstNameController: firstNameController,
                            lastNameController: lastNameController,
                          ),
                          // Gender and birthday
                          EpHeaderGenderAndBirthday(
                            initialGenderValue: currentGenderValue,
                            birthdayController: birthdayController,
                            onGenderChanged: (value) {
                              setState(() {
                                currentGenderValue = value!;
                                showButton =
                                    currentGenderValue !=
                                    userProfile!.user.gender;
                              });
                            },
                          ),
                          // Height and weight
                          EpHeaderHeightAndWeight(
                            heightController: heightController,
                            weightController: weightController,
                          ),
                          // Blood group
                          EpHeaderBloodGroup(
                            initialValue: state.userProfile.user.bloodGroup,
                            onChanged: (value) {
                              setState(() {
                                currentBloodGroup = value!;
                                showButton =
                                    currentBloodGroup !=
                                    userProfile!.user.bloodGroup;
                              });
                            },
                          ),
                        ],
                        // Important Box (Containing important note and voice note)
                        EpImportantWidget(
                          controller: importantNoteController,
                          url: state.userProfile.user.importantNote,
                        ),
                        // Emergency contacts Part
                        EpEmergencyContacts(
                          familyContacts: state.userProfile.familyContacts,
                          addresses: state.userProfile.addresses,
                          doctorContacts: state.userProfile.doctorContacts,
                        ),
                        // Location Part
                        EpLocationBox(),
                        if (widget.profileType == ProfileType.pet)
                          // Pet Characterestics Part
                          EpPetCharacteresticsBox(
                            characterController: characterController,
                            bloodGroupController: bloodGroupController,
                            sizeController: petSizeController,
                            weightController: petWeightController,
                            genderValue: petGenderValue,
                            castratedValue: castrated,
                            birthdayController: petDateOfBirthController,
                            onGenderChanged: (value) {
                              setState(() {
                                petGenderValue = value!;
                                showButton =
                                    petGenderValue != userProfile!.user.gender;
                              });
                            },
                            onCastratedChanged: (value) {
                              setState(() {
                                castrated = value!;
                                showButton =
                                    castrated != userProfile!.user.castrated;
                              });
                            },
                            onBirthdayChanged: (status) {},
                          ),
                        if (widget.profileType == ProfileType.pet)
                          // Pet Identification Part
                          EpPetIdentificationBox(
                            chipped: chipped,
                            onChipChanged: (value) {
                              setState(() {
                                chipped = value!;
                                showButton =
                                    chipped != userProfile!.user.chipped;
                              });
                            },
                            chippedPositionController: chipPositionController,
                            taxNoController: taxNoController,
                            tassoNoController: tassoNoController,
                            petInsuranceCompanyController:
                                petInsuranceCompanyController,
                            petInsuranceIdController:
                                petInsuranceIdInformationController,
                            specialFeaturesController: specialFeatureController,
                          ),
                        // Medical Information Part
                        EpMedicalInformation(
                          notAddedDiseaseTypes:
                              state.userProfile.notAddedDiseaseTypes,
                          addedDiseaseType: state.userProfile.addedDiseaseType,
                        ),
                        // Medication Plan part
                        EpMedicationPlan(
                          medicationDocuments:
                              state.userProfile.medicationDocuments,
                        ),
                        // Important documents part
                        // EpImportantDocuments(),
                        // Pictures and documents
                        EpPicturesAndDocuments(
                          documents: state.userProfile.documents,
                        ),
                        if (!(widget.profileType == ProfileType.pet))
                          // Insurance Information
                          EpInsuranceInformation(
                            insuranceCompanyController:
                                insuranceCompanyController,
                            insuranceIDController: insuranceIdController,
                          ),
                      ],
                    );
                  } else if (state is GetProfileDataErrorState) {
                    return EditProfileErrorWidget(message: state.message);
                  }
                  return Container();
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void refreshData() {
    context.read<GetProfileDataBloc>().add(
      GetUserProfileDataEvent(showLoading: false),
    );
  }

  void _handleGetProfileDataListener(
    BuildContext context,
    GetProfileDataState state,
  ) {
    if (state is GetProfileDataLoadedState) {
      userProfile = state.userProfile;
      if (widget.profileType == ProfileType.pet) {
        initialzeWithDataForPet(state.userProfile);
      } else {
        initialzeWithData(state.userProfile);
      }
      inputListener();
    }
  }

  void _handleUpdateBasicInfoListener(
    BuildContext context,
    UpdateBasicInfoState state,
  ) {
    if (state is UpdateBasicInfoLoadedState) {
      refreshData();
    }
  }

  void _handleDeleteDiseaseListener(
    BuildContext context,
    DeleteDiseaseState state,
  ) {
    if (state is DeleteDiseaseDoneState) {
      refreshData();
    }
  }

  void _handleLockDiseaseListener(
    BuildContext context,
    LockDiseaseState state,
  ) {
    if (state is LockDiseaseDoneState) {
      refreshData();
    }
  }

  void _handleUpdateDocuemntListener(
    BuildContext context,
    UploadDocumentState state,
  ) {
    if (state is UploadDocumentLoaded) {
      refreshData();
    }
  }

  void _handleDeleteDocumentListener(
    BuildContext context,
    DeleteDocumentState state,
  ) {
    if (state is DeleteDocumentLoaded) {
      refreshData();
    }
  }

  void _handleLockDocumentListener(
    BuildContext context,
    LockDocumentState state,
  ) {
    if (state is LockDocumentLoaded) {
      refreshData();
    }
  }
}

class EditProfileLoadingWidget extends StatelessWidget {
  const EditProfileLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class EditProfileErrorWidget extends StatelessWidget {
  final String message;
  const EditProfileErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
