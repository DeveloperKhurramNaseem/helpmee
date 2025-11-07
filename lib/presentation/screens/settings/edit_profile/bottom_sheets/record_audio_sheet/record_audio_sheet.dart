
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/get_profile_data/get_profile_data_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/upload_voice/upload_voice/upload_voice_bloc.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/record_audio_sheet/widgets/ra_recording_widget.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/record_audio_sheet/widgets/ra_texts.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class RecordAudioSheet extends StatefulWidget {
  final bool update;
  const RecordAudioSheet({super.key, this.update = false});

  @override
  State<RecordAudioSheet> createState() => _RecordAudioSheetState();
}

class _RecordAudioSheetState extends State<RecordAudioSheet> {
  bool showButton = false;
  File? recordedFile;
  @override
  Widget build(BuildContext context) {    
    var localization = AppLocalizations.of(context)!;
    return BlocListener<UploadVoiceBloc, UploadVoiceState>(
      listener: _uploadVoiceListener,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Wrap(
          children: [
            RaTitle(text: localization.recordAudio),
            RaDetail(text: localization.recordAudioDetail),
            RaRecordingWidget(
              update: widget.update,
              showButton: (show) {
                setState(() {
                  showButton = show;
                });
              },
              onRecorded: (file) {
                recordedFile = file;
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(33.0, 0, 33, 0),
              child: BlocBuilder<UploadVoiceBloc, UploadVoiceState>(
                builder: (context, state) {
                  return Opacity(
                    opacity: showButton ? 1 : 0.7,
                    child: AppButton(
                      onPressed: showButton
                          ? () {
                              if (recordedFile != null) {
                                context.read<UploadVoiceBloc>().add(
                                  UploadVoiceNoteEvent(file: recordedFile!),
                                );
                              }
                            }
                          : null,
                      gradient: Theme.of(
                        context,
                      ).extension<AppGradients>()!.primaryButton,
                      child: state is UploadVoiceLoadingState
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
    );
  }

  void _uploadVoiceListener(BuildContext context, UploadVoiceState state) {
    if (state is UploadVoiceLoadedState) {
      context.read<GetProfileDataBloc>().add(GetUserProfileDataEvent( ));
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
