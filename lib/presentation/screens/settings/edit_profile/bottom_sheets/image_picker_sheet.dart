import 'dart:io';
import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerSheet extends StatelessWidget {
  final void Function(File) onImagePicked;
  const ImagePickerSheet({super.key, required this.onImagePicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: AppButtonOutlined(
              onPressed: () {
                ImagePicker().pickImage(source: ImageSource.camera).then((
                  value,
                ) {
                  if (value != null) {
                    onImagePicked(File(value.path));
                  }
                });
              },
              child: Text(
                AppLocalizations.of(context)!.photoFromCamera,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              24.0,
              8.0,
              24.0,
              Platform.isAndroid ? 12 : 8,
            ),
            child: AppButtonOutlined(
              onPressed: () {
                ImagePicker().pickImage(source: ImageSource.gallery).then((
                  value,
                ) {
                  if (value != null) {
                    onImagePicked(File(value.path));
                  }
                });
              },
              child: Text(
                AppLocalizations.of(context)!.photoFromLibrary,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
