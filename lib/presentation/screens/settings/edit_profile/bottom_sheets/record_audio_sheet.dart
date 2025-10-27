import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/painter/waveform_painter.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

enum CurrentRecordingState { initial, recording, recorded }

class RecordAudioSheet extends StatelessWidget {
  const RecordAudioSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localization.recordAudio,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
                    localization.recordAudioDetail,
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
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 40),
            child: Container(
              height: AppSize.instance.height * 0.1,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(249, 249, 249, 0.55),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(237, 237, 237, 1),
                  width: 1,
                ),
              ),
              child: RecrodingWidget(state: CurrentRecordingState.recording),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(33.0, 0, 33, 0),
            child: Opacity(
              opacity: 1,
              child: AppButton(
                onPressed: () {},
                gradient: Theme.of(
                  context,
                ).extension<AppGradients>()!.primaryButton,
                child: Text(
                  AppLocalizations.of(context)!.saveButton,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecrodingWidget extends StatelessWidget {
  final CurrentRecordingState state;
  const RecrodingWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state == CurrentRecordingState.initial) {
      return RecordingInitialWidget();
    }
    if (state == CurrentRecordingState.recording) {
      return RecordingInProgressWidget();
    }
    return RecordingDoneWidget();
  }
}

class RecordingInitialWidget extends StatelessWidget {
  const RecordingInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Press microphone to record audio'),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppLightThemeColors.gradientFirstColor),
          ),
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset(AppIcons.microphoneOnlyIcon),
        ),
      ],
    );
  }
}

class RecordingInProgressWidget extends StatelessWidget {
  const RecordingInProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    Text(
                      '0:00',
                      style: TextStyle(
                        color: AppLightThemeColors.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: AppSize.instance.height * 0.065,
                        child: CustomPaint(
                          painter: FancyWaveformPainter(
                            position: Duration.zero,
                            duration: Duration(seconds: 10),
                            amps: amps,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppIcons.del, width: 15, height: 15),
                    SvgPicture.asset(AppIcons.pauseIcon, width: 15, height: 15),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppLightThemeColors.gradientFirstColor,
                        ),
                      ),
                      padding: EdgeInsets.all(5),

                      child: SvgPicture.asset(
                        AppIcons.tickIcon,
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RecordingDoneWidget extends StatelessWidget {
  const RecordingDoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppLightThemeColors.gradientFirstColor),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 10),
          child: SvgPicture.asset(AppIcons.playIcon),
        ),
        Expanded(
          child: SizedBox(
            height: AppSize.instance.height * 0.065,
            child: CustomPaint(
              painter: FancyWaveformPainter(
                position: Duration.zero,
                duration: Duration(seconds: 10),
                amps: amps,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<double> amps = [
  10.0,
  12.0,
  6.0,
  7.0,
  18.0,
  11.0,
  8.0,
  5.0,
  10.0,
  14.0,
  15.0,
  7.0,
  10.0,
  10.0,
  4.0,
  5.0,
  8.0,
  16.0,
  10.0,
  17.0,
  6.0,
  15.0,
  9.0,
  13.0,
  14.0,
  7.0,
  18.0,
  11.0,
  12.0,
  5.0,
  17.0,
  4.0,
  3.0,
  7.0,
  6.0,
  10.0,
  15.0,
  16.0,
  8.0,
  17.0,
  6.0,
  18.0,
  4.0,
  7.0,
  5.0,
  6.0,
  8.0,
  15.0,
  8.0,
  14.0,
  6.0,
  16.0,
  7.0,
  18.0,
  19.0,
  7.0,
  16.0,
  6.0,
  6.0,
  7.0,
  10.0,
  12.0,
  18.0,
  11.0,
  6.0,
  12.0,
  8.0,
  6.0,
  14.0,
  6.0,
  19.0,
  12.0,
  6.0,
  18.0,
  8.0,
  16.0,
  6.0,
  10.0,
  10.0,
  8.0,
  16.0,
  7.0,
  6.0,
  19.0,
  9.0,
  6.0,
  16.0,
  15.0,
  13.0,
  12.0,
  9.0,
  3.0,
  15.0,
  1.0,
  7.0,
  11.0,
  18.0,
  15.0,
  3.0,
  19.0,
  12.0,
  9.0,
  3.0,
  15.0,
  1.0,
  7.0,
  11.0,
  18.0,
  15.0,
  3.0,
  19.0,
];
