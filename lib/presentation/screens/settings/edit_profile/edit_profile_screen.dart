import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/get_profile_data/get_profile_data_bloc.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_app_bar.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_emergency_contacts.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_image.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_important_documents.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_important_widget.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_insurance_information.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_location_box.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_medical_information.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_medication_plan.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_pictures_and_documents.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  static const path = '/edit-profile-screen';
  final bool isPet;
  const EditProfileScreen({super.key, required this.isPet});

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
  int currentGenderValue = 0;
  @override
  void initState() {
    super.initState();
    context.read<GetProfileDataBloc>().add(GetUserProfileDataEvent());
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    birthdayController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
    importantNoteController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    birthdayController.dispose();
    heightController.dispose();
    weightController.dispose();
    importantNoteController.dispose();
    super.dispose();
  }

  initialzeWithData(UserProfileModel userProfile) {
    firstNameController.text = userProfile.user.firstName;
    lastNameController.text = userProfile.user.lastName;
    birthdayController.text = DateFormat(
      'MMMM dd, yyyy',
    ).format(DateTime.parse(userProfile.user.dateOfBirth));
    heightController.text = userProfile.user.height;
    weightController.text = userProfile.user.weight;
    importantNoteController.text = userProfile.user.importantNote;
  }

  void _handleGetProfileDataListener(BuildContext context, GetProfileDataState state) {
    if(state is GetProfileDataLoadedState){
      initialzeWithData(state.userProfile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetProfileDataBloc, GetProfileDataState>(
      listener: _handleGetProfileDataListener,
      child: Scaffold(
        appBar: EpAppBar(),
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
                    EpHeaderImage(),
                    // if (widget.isPet) ...[
                    //   EpPetNameField(
                    //     controller: TextEditingController()..text = 'Buddy',
                    //   ),
                    //   EpPetRaceField(
                    //     controller: TextEditingController()..text = 'Buddy',
                    //   ),
                    // ] else ...[
                    // First name and last name
                    EpHeaderFirstAndLastName(
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                    ),
                    // Gender and birthday
                    EpHeaderGenderAndBirthday(
                      birthdayController: birthdayController,
                      onGenderChanged: (value) {
                        currentGenderValue = value!;
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
                      onChanged: (value) {},
                    ),
                    // ],
                    // Important Box (Containing important note and voice note)
                    EpImportantWidget(controller: importantNoteController),
                    // Emergency contacts Part
                    EpEmergencyContacts(
                      familyContacts: state.userProfile.familyContacts,
                      addresses: state.userProfile.addresses,
                      doctorContacts: state.userProfile.doctorContacts,
                    ),
                    // Location Part
                    EpLocationBox(),
                    // if (widget.isPet)
                    //   // Pet Characterestics Part
                    //   EpPetCharacteresticsBox(),
                    // if (widget.isPet)
                    //   // Pet Identification Part
                    //   EpPetIdentificationBox(),
                    // Medical Information Part
                    EpMedicalInformation(),
                    // Medication Plan part
                    EpMedicationPlan(),
                    // Important documents part
                    EpImportantDocuments(),
                    // Pictures and documents
                    EpPicturesAndDocuments(),
                    // if (!widget.isPet)
                    // Insurance Information
                    EpInsuranceInformation(),
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
