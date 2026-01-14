import 'dart:developer';

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

class EpPicturesAndDocuments extends StatelessWidget {
  final List<Document> documents;
  const EpPicturesAndDocuments({super.key, required this.documents});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseWithoutTitleBorderBox(
          titleText: localization.picturesAndDocuments,
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              for (var i = 0; i < documents.length; i++)
                PictureAndDocuemntsTile(
                  text: documents[i].name,
                  image: isImage(documents[i].imageExtension.toLowerCase())
                      ? documents[i].image
                      : null,
                  status: documents[i].status,
                  docId: documents[i].id,
                ),
              AddPictureAndDocuemntsTile(),
            ],
          ),
        ),
      ),
    );
  }

  bool isImage(String extension) {
    var isImage = (RegExp(
      r'(jpg|jpeg|png|gif|webp|bmp)',
      caseSensitive: false,
    ).hasMatch(extension));
    log('isImage : $isImage , Image extension : $extension');
    return isImage;
  }
}

class AddPictureAndDocuemntsTile extends StatelessWidget {
  const AddPictureAndDocuemntsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return EpBaseAddTile(
      title: AppLocalizations.of(context)!.addPicturesORDocuments,
      onTap: () {
        m.showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) {
            return UploadDocumentSheet(documentType: DocumentType.simple);
          },
        );
      },
    );
  }
}

class PictureAndDocuemntsTile extends StatelessWidget {
  final String text;
  final String? image;
  final int docId;
  final String status;
  const PictureAndDocuemntsTile({
    super.key,
    required this.text,
    this.image,
    required this.docId,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteDocumentBloc, DeleteDocumentState>(
      builder: (context, delState) {
        return BlocBuilder<LockDocumentBloc, LockDocumentState>(
          builder: (context, state) {
            return EpBaseTile(
              title: text,
              onTap: () {},
              state: image != null ? BaseTileState.image : BaseTileState.pdf,
              image: image,
              isLock: status == 'lock',
              onDeleteTap:
                  delState is DeleteDocumentLoading && docId == delState.docId
                  ? null
                  : () {
                      context.read<DeleteDocumentBloc>().add(
                        DeleteCurrentDocumentEvent(docId),
                      );
                    },
              onEditTap: null,
              onLockTap: state is LockDocumentLoading && docId == state.docId
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
