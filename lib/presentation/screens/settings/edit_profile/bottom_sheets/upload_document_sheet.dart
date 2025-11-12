import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/picture_and_documents/upload_document/upload_document_bloc.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as path;

enum DocumentType { simple, medication }

class UploadDocumentSheet extends StatefulWidget {
  final DocumentType documentType;
  const UploadDocumentSheet({super.key, required this.documentType});

  @override
  State<UploadDocumentSheet> createState() => _UploadDocumentSheetState();
}

class _UploadDocumentSheetState extends State<UploadDocumentSheet> {
  late TextEditingController fileNameController;
  File? pickedFile;
  String pickedFileName = '';

  @override
  void initState() {
    super.initState();
    fileNameController = TextEditingController()..addListener(_listener);
  }

  @override
  void dispose() {
    fileNameController.dispose();
    super.dispose();
  }

  bool get enabled => fileNameController.text.isNotEmpty && pickedFile != null;

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return BlocListener<UploadDocumentBloc, UploadDocumentState>(
      listener: _handleUploadDocumentListener,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      widget.documentType == DocumentType.simple
                          ? localization.uploadImageOrDocument
                          : localization.uploadDocumentButton,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.documentType == DocumentType.simple
                            ? '${localization.uploadPictureOrDocumentDetail}\n\n${localization.examplesLabel}\n${localization.uploadPictureOrDocumentExamples}'
                            : '${localization.uploadPdfDocumentDetail}\n\n${localization.examplesLabel}\n${localization.uploadPdfDocumentExamples}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppLightThemeColors.secondaryTextColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 10),
                child: EpHeaderInfoBaseField(
                  label: localization.fileName,
                  controller: fileNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 50),
                child: EpBaseAddTile(
                  title: pickedFile != null
                      ? pickedFileName //path.basename(pickedFile!.path)
                      : widget.documentType == DocumentType.medication
                      ? localization.uploadDocumentButton
                      : localization.uploadImageOrDocument,
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (widget.documentType == DocumentType.medication) {
                      var filePickerResult = await FilePicker.platform
                          .pickFiles(allowedExtensions: ['pdf'] , type: FileType.custom);
                      if (filePickerResult != null) {
                        setState(() {
                          pickedFile = File(
                            filePickerResult.files.single.path!,                            
                          );
                          pickedFileName = filePickerResult.files.single.name;
                        });
                      }
                    } else if (widget.documentType == DocumentType.simple) {
                      showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        isScrollControlled: true,
                        builder: (context) {
                          return ImageAndDocumentPickerSheet(
                            onFilePicked: (file , name) {
                              setState(() {
                                pickedFile = file;       
                                pickedFileName = name;                         
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: BlocBuilder<UploadDocumentBloc, UploadDocumentState>(
                  builder: (context, state) {
                    return Opacity(
                      opacity: enabled ? 1 : 0.7,
                      child: AppButton(
                        onPressed: state is UploadDocumentLoading
                            ? null
                            : enabled
                            ? () {
                                if (pickedFile != null) {
                                  context.read<UploadDocumentBloc>().add(
                                    UploadNewDocumentEvent(
                                      documentType: widget.documentType,
                                      documentName: fileNameController.text
                                          .trim(),
                                      documentFile: pickedFile!,
                                    ),
                                  );
                                }
                              }
                            : null,
                        gradient: Theme.of(
                          context,
                        ).extension<AppGradients>()!.primaryButton,
                        child: state is UploadDocumentLoading
                            ? CupertinoActivityIndicator(color: Colors.white)
                            : Text(
                                AppLocalizations.of(context)!.saveButton,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listener() {
    setState(() {});
  }

  void _handleUploadDocumentListener(
    BuildContext context,
    UploadDocumentState state,
  ) {
    if (state is UploadDocumentLoaded) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}

class ImageAndDocumentPickerSheet extends StatelessWidget {
  final void Function(File,String) onFilePicked;

  const ImageAndDocumentPickerSheet({super.key, required this.onFilePicked});

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
                FilePicker.platform.pickFiles(allowedExtensions: ['pdf'], type: FileType.custom).then((
                  value,
                ) {
                  if (value != null) {
                    onFilePicked(File(value.files.single.path!),value.files.single.name);
                  }
                });
              },
              child: Text(
                AppLocalizations.of(context)!.document,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: AppButtonOutlined(
              onPressed: () {
                ImagePicker().pickImage(source: ImageSource.camera).then((
                  value,
                ) {
                  if (value != null) {
                    onFilePicked(File(value.path),value.name);
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
                    onFilePicked(File(value.path) , value.name);
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
