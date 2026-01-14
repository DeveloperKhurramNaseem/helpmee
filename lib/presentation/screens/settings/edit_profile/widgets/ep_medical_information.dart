import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/medical_information/delete_disease/delete_disease_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/medical_information/lock_disease/lock_disease_bloc.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/add_disease_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/add_medical_information_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/common_widgets/show_bottom_sheet.dart' as m;
class EpMedicalInformation extends StatelessWidget {
  final List<Disease> notAddedDiseaseTypes, addedDiseaseType;  
  const EpMedicalInformation({
    super.key,
    required this.addedDiseaseType,
    required this.notAddedDiseaseTypes,    
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseBox(
          titleText: AppLocalizations.of(context)!.medicalInformation,
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              for (var i = 0; i < addedDiseaseType.length; i++)
                MedicalInformationTile(
                  text: addedDiseaseType[i].name,
                  diseaseId: addedDiseaseType[i].diseaseDetails.id,
                  id: addedDiseaseType[i].id,
                  index: i,
                  addedDiseaseTypes: addedDiseaseType,
                  status: addedDiseaseType[i].diseaseDetails.status,
                ),
              AddMedicalInformationTile(
                notAddedDiseaseTypes: notAddedDiseaseTypes,                
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddMedicalInformationTile extends StatelessWidget {
  final List<Disease> notAddedDiseaseTypes;  
  const AddMedicalInformationTile({
    super.key,
    required this.notAddedDiseaseTypes,    
  });

  @override
  Widget build(BuildContext context) {
    return EpBaseAddTile(
      title: AppLocalizations.of(context)!.addMedicationInformationButton,
      onTap: () {
        m.showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) {
            return AddMedicalInformationSheet(
              notAddedDiseaseTypes: notAddedDiseaseTypes,              
            );
          },
        );
      },
    );
  }
}

class MedicalInformationTile extends StatelessWidget {
  final String text;
  final int diseaseId;
  final int id;
  final int index;
  final List<Disease> addedDiseaseTypes;
  final String status;
  const MedicalInformationTile({
    super.key,
    required this.text,
    required this.diseaseId,
    required this.id,
    required this.index,
    required this.addedDiseaseTypes,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LockDiseaseBloc, LockDiseaseState>(
      builder: (context, lockState) {
        return BlocBuilder<DeleteDiseaseBloc, DeleteDiseaseState>(
          builder: (context, deleteState) {
            return EpBaseTile(
              title: text,
              onTap: () {},
              state: BaseTileState.simple,
              isLock: status == 'lock',
              onDeleteTap:
                  deleteState is DeleteDiseaseLoadingState &&
                      deleteState.index == index
                  ? null
                  : () {
                      context.read<DeleteDiseaseBloc>().add(
                        DeleteCurrentDiseaseEvent(diseaseId, index),
                      );
                    },
              onEditTap: () {
                m.showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (context) {
                    var diseaseInfo = diseaseInfoBasedOnIndex(
                      addedDiseaseTypes[index].id,
                      context,
                    );
                    return AddDiseaseSheet(
                      id: addedDiseaseTypes[index].id,
                      title: addedDiseaseTypes[index].name,
                      description: diseaseInfo.description,
                      hasCheck: diseaseInfo.hasCheck,
                      diseaseDetails: addedDiseaseTypes[index].diseaseDetails,
                    );
                  },
                );
              },
              onLockTap:
                  lockState is LockDiseaseLoadingState &&
                      lockState.index == index
                  ? null
                  : () {
                      context.read<LockDiseaseBloc>().add(
                        LockCurrentDiseaseEvent(
                          diseaseId,
                          index,
                          status == 'lock' ? 'unlock' : 'lock',
                        ),
                      );
                    },
            );
          },
        );
      },
    );
  }
}
