import 'package:flutter/material.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/upload_picture_document_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/theme/app_colors.dart';

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
                  image: documents[i].image,
                ),
              AddPictureAndDocuemntsTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddPictureAndDocuemntsTile extends StatelessWidget {
  const AddPictureAndDocuemntsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return EpBaseAddTile(
      title: AppLocalizations.of(context)!.addPicturesORDocuments,
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) {
            return UploadPictureDocumentSheet();
          },
        );
      },
    );
  }
}

class PictureAndDocuemntsTile extends StatelessWidget {
  final String text;
  final String? image;
  const PictureAndDocuemntsTile({super.key, required this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return EpBaseTile(
      title: text,
      onTap: () {},
      state: image != null ? BaseTileState.image : BaseTileState.pdf,
      image: image,
    );
  }
}
