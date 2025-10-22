import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class EpPicturesAndDocuments extends StatelessWidget {
  const EpPicturesAndDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseWithoutTitleBorderBox(
          titleText: 'Pictures and documents',
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              PictureAndDocuemntsTile(
                text: 'Skin rash on right hand',
                image:
                    'https://images.unsplash.com/photo-1757416654883-c73c67b3382b?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
              PictureAndDocuemntsTile(text: 'Power of attorney'),
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
    return EpBaseAddTile(title: 'Add picture / document', onTap: () {});
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
