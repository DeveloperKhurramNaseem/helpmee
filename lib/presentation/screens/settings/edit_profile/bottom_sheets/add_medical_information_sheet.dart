import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/add_disease_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/common_widgets/show_bottom_sheet.dart' as m;

class AddMedicalInformationSheet extends StatelessWidget {
  final List<Disease> notAddedDiseaseTypes;  
  const AddMedicalInformationSheet({
    super.key,
    required this.notAddedDiseaseTypes,
 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.addMedicationInformationButton,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          for (var i = 0; i < notAddedDiseaseTypes.length; i++)
            AddMedicalInformationTile(
              title: notAddedDiseaseTypes[i].name,
              onTap: () {
                m.showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (context) {
                    var diseaseInfo = diseaseInfoBasedOnIndex(
                      notAddedDiseaseTypes[i].id,
                      context,
                    );
                    return AddDiseaseSheet(                      
                      id: notAddedDiseaseTypes[i].id,
                      title: notAddedDiseaseTypes[i].name,
                      description: diseaseInfo.description,
                      hasCheck: diseaseInfo.hasCheck,
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}

({bool hasCheck, String description}) diseaseInfoBasedOnIndex(
  int index,
  BuildContext context,
) {
  var localization = AppLocalizations.of(context)!;

  return switch (index) {
    1 => (hasCheck: false, description: localization.doYouHaveAllergies),
    2 => (
      hasCheck: false,
      description: localization.doYouSufferFromInfectiousDiseases,
    ),
    3 => (
      hasCheck: true,
      description: localization.yesSufferingFromCoagulationDisorders,
    ),
    4 => (
      hasCheck: true,
      description: localization.yesUsingPacemakerOrDefibrillator,
    ),
    5 => (hasCheck: false, description: localization.haveYouHadHeartAttacks),
    6 => (
      hasCheck: true,
      description: localization.yesSufferingFromAsthmaOrCOPD,
    ),

    7 => (hasCheck: false, description: localization.doYouSufferFromDiabetes),
    8 => (hasCheck: true, description: localization.yesOnDialysis),
    9 => (
      hasCheck: true,
      description: localization.yesSufferingFromSeizureDisorder,
    ),
    10 => (hasCheck: false, description: localization.doYouHaveMentalIllness),
    _ => (hasCheck: false, description: localization.doYouHaveOtherIllnesses),
  };
}

class AddMedicalInformationTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AddMedicalInformationTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: AppSize.instance.height * 0.065,
          decoration: BoxDecoration(
            color: Color.fromRGBO(249, 249, 249, 0.55),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromRGBO(237, 237, 237, 1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 8, 18),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(AppIcons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
