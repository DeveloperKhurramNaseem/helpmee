import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';

class EpImportantDocuments extends StatelessWidget {
  const EpImportantDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseBox(
          titleText: 'Important documents',
          titleBorderColor: Theme.of(context).colorScheme.primary,
          bodyBorderColor: Theme.of(context).colorScheme.primary,
          titleBackgroundColor: Theme.of(context).colorScheme.primary,
          titleColor: Theme.of(context).colorScheme.onPrimary,
          child: Column(
            spacing: 10,
            children: [
              ImportantDocumentsTile(
                text: 'Organ donor card',
                image:
                    'https://images.unsplash.com/photo-1757416654883-c73c67b3382b?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
              ImportantDocumentsTile(text: 'Power of attorney'),
              AddImportantDocumentsTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddImportantDocumentsTile extends StatelessWidget {
  const AddImportantDocumentsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return EpBaseAddTile(title: 'Add important document', onTap: () {});
  }
}

class ImportantDocumentsTile extends StatelessWidget {
  final String text;
  final String? image;
  const ImportantDocumentsTile({super.key, required this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return EpBaseTile(
      title: text,
      onTap: () {},
      state: image != null ? BaseTileState.image : BaseTileState.pdf,
      image: image,
      onDeleteTap: () {},
      onEditTap: () {},
      onLockTap: () {},
    );
  }
}
