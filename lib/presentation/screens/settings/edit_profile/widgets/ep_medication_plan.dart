import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/picture_and_documents/delete_document/delete_document_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/picture_and_documents/lock_document/lock_document_bloc.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/upload_document_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/common_widgets/show_bottom_sheet.dart' as m;

class EpMedicationPlan extends StatelessWidget {
  final List<Document> medicationDocuments;
  const EpMedicationPlan({super.key, required this.medicationDocuments});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseWithoutTitleBorderBox(
          titleText: AppLocalizations.of(context)!.medicationPlanLabel,
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              for (var i = 0; i < medicationDocuments.length; i++)
                AddMedicationPdfTile(
                  text: medicationDocuments[i].name,
                  docId: medicationDocuments[i].id,
                  status: medicationDocuments[i].status,
                  index: i,
                ),
              AddMedicationPlanTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddMedicationPlanTile extends StatelessWidget {
  const AddMedicationPlanTile({super.key});

  @override
  Widget build(BuildContext context) {
    return EpBaseAddTile(
      title: AppLocalizations.of(context)!.addMedicationPlanButton,
      onTap: () {
        m.showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) {
            return UploadDocumentSheet(documentType: DocumentType.medication);
          },
        );
      },
    );
  }
}

class AddMedicationPdfTile extends StatelessWidget {
  final String text;
  final int docId;
  final String status;
  final int index;
  const AddMedicationPdfTile({
    super.key,
    required this.text,
    required this.docId,
    required this.status,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LockDocumentBloc, LockDocumentState>(
      builder: (context, lockState) {
        return BlocBuilder<DeleteDocumentBloc, DeleteDocumentState>(
          builder: (context, state) {
            return EpBaseTile(
              title: text,
              state: BaseTileState.pdf,
              isLock: status == 'lock',
              onTap: () {},
              onDeleteTap:
                  state is DeleteDocumentLoading && docId == state.docId
                  ? null
                  : () {
                      context.read<DeleteDocumentBloc>().add(
                        DeleteCurrentDocumentEvent(docId),
                      );
                    },
              onEditTap: null,
              onLockTap:
                  lockState is LockDocumentLoading && docId == lockState.docId
                  ? null
                  : () {
                      context.read<LockDocumentBloc>().add(
                        LockCurrentDocumentEvent(
                          docId,
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
