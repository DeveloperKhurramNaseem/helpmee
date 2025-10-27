import 'package:flutter/material.dart';
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
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_pet_characterestics_box.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_pet_identification.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_pet_name_and_race.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_pictures_and_documents.dart';

class EditProfileScreen extends StatefulWidget {
  static const path = '/edit-profile-screen';
  final bool isPet;
  const EditProfileScreen({super.key, required this.isPet});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EpAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          slivers: [
            // Header Image
            EpHeaderImage(),
            if (widget.isPet) ...[
              EpPetNameField(
                controller: TextEditingController()..text = 'Buddy',
              ),
              EpPetRaceField(
                controller: TextEditingController()..text = 'Buddy',
              ),
            ] else ...[
              // First name and last name
              EpHeaderFirstAndLastName(
                firstNameController: TextEditingController()..text = 'Khuram',
                lastNameController: TextEditingController()..text = 'Naseem',
              ),
              // Gender and birthday
              EpHeaderGenderAndBirthday(
                birthdayController: TextEditingController(),
                genderController: TextEditingController(),
              ),
              // Height and weight
              EpHeaderHeightAndWeight(
                heightController: TextEditingController()..text = '170',
                weightController: TextEditingController()..text = '60',
              ),
              // Blood group
              EpHeaderBloodGroup(),
            ],
            // Important Box (Containing important note and voice note)
            EpImportantWidget(),
            // Emergency contacts Part
            EpEmergencyContacts(),
            // Location Part
            EpLocationBox(),
            if (widget.isPet)
              // Pet Characterestics Part
              EpPetCharacteresticsBox(),
            if (widget.isPet)
              // Pet Identification Part
              EpPetIdentificationBox(),
            // Medical Information Part
            EpMedicalInformation(),
            // Medication Plan part
            EpMedicationPlan(),
            // Important documents part
            EpImportantDocuments(),
            // Pictures and documents
            EpPicturesAndDocuments(),
            if (!widget.isPet)
              // Insurance Information
              EpInsuranceInformation(),
          ],
        ),
      ),
    );
  }
}
