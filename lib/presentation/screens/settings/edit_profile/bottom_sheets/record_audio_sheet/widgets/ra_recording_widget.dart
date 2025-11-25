import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/record_audio_sheet/widgets/ra_recording_player_widget.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/painter/waveform_painter.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

enum CurrentRecordingState { initial, recorded }

class RaRecordingWidget extends StatefulWidget {
  final void Function(bool) showButton;
  final void Function(File? file) onRecorded;
  final String? url;
  final List<double> amps;
  const RaRecordingWidget({
    super.key,
    required this.showButton,
    required this.onRecorded,
    this.url,
    this.amps = const [],
  });

  @override
  State<RaRecordingWidget> createState() => _RaRecordingWidgetState();
}

class _RaRecordingWidgetState extends State<RaRecordingWidget> {
  static const int maxSeconds = 15;
  static const Duration amplitudeSampleEvery = Duration(
    milliseconds: 50,
  ); // ~20 FPS

  final _record = AudioRecorder();
  Timer? _ticker;
  Timer? _ampPoller;

  CurrentRecordingState _state = CurrentRecordingState.initial;

  int _remaining = maxSeconds;
  bool _recording = false;
  List<double> _amplitudes = []; // normalized 0..1
  DateTime? _startedAt;
  String? _filePath;
  String? path;

  @override
  void initState() {
    super.initState();
    if (widget.url != null) {
      _state = CurrentRecordingState.recorded;
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _ampPoller?.cancel();
    _record.dispose();
    super.dispose();
  }

  Future<String> _tempFilePath() async {
    final dir = await getTemporaryDirectory();
    final ts = DateTime.now().millisecondsSinceEpoch;
    return '${dir.path}/voice_note_$ts.m4a';
  }

  Future<void> _startRecording() async {
    if (_recording) return;

    // Check permission
    final hasPerm = await _record.hasPermission();
    if (!hasPerm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Microphone permission required')),
      );
      return;
    }

    final path = await _tempFilePath();

    // Start recording (AAC in M4A is widely supported)
    await _record.start(
      RecordConfig(
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        numChannels: 1,
        sampleRate: 44100,
      ),
      path: path,
    );

    setState(() {
      _recording = true;
      _remaining = maxSeconds;
      _amplitudes = [];
      _startedAt = DateTime.now();
      _filePath = path;
    });

    // Countdown
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (t) async {
      if (!_recording) {
        t.cancel();
        return;
      }
      if (_remaining <= 1) {
        // Auto-stop at 0
        await _stopRecording(auto: true);
        t.cancel();
      } else {
        setState(() => _remaining -= 1);
      }
    });

    // Poll amplitude
    _ampPoller?.cancel();
    _ampPoller = Timer.periodic(amplitudeSampleEvery, (timer) async {
      if (!_recording) {
        timer.cancel();
        return;
      }
      try {
        final amp = await _record.getAmplitude();
        // amp.current is in dB (negative) on some platforms; convert to a 0..1 “intensity”.
        // Simple mapping: take absolute value, clamp, normalize.
        // You can tune this curve to taste for a nicer visual.
        final double intensity = _normalizeDbToUnit(amp.current);
        setState(() {
          _amplitudes.add(intensity);
        });
      } catch (_) {}
    });
  }

  // Map dB or raw value to 0..1; adjust constants to taste.
  double _normalizeDbToUnit(double value) {
    // The record package commonly returns negative dB (e.g., -45 .. 0).
    // Convert: higher (closer to 0) => bigger bars.
    // Clamp in a plausible range to avoid crazy spikes.
    final db = value.isNaN ? -60.0 : value;
    final clamped = db.clamp(-60.0, 0.0); // -60dB (quiet) .. 0dB (loud)
    final unit = (clamped + 60.0) / 60.0; // 0..1
    // Ease it slightly so small sounds are still visible:
    return pow(unit, 0.6).toDouble().clamp(0.0, 1.0);
  }

  Future<void> _stopRecording({bool auto = false}) async {
    if (!_recording) return;
    _ticker?.cancel();
    _ampPoller?.cancel();
    path = await _record.stop();

    setState(() {
      _recording = false;
    });

    if (!mounted) return;
    _state = CurrentRecordingState.recorded;
    widget.showButton(true);
    widget.onRecorded(File((path ?? _filePath)!));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final countdown = _recording
        ? _remaining.toString().padLeft(2, '0')
        : '$maxSeconds';
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 40),
      child: Container(
        height: AppSize.instance.height * 0.1,
        padding: EdgeInsets.only(left: 2, right: 12),
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 249, 249, 0.55),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(237, 237, 237, 1), width: 1),
        ),
        child: _state == CurrentRecordingState.initial
            ? RecordingInitialWidget(
                startRecording: _startRecording,
                stopRecording: _stopRecording,
                amplitudes: _amplitudes,
                countDown: countdown,
                recording: _recording,
              )
            : RecordingPlayerWidget(
                filePath: path ?? _filePath,
                url: widget.url,
                waveform: widget.amps.isNotEmpty ? widget.amps : getWaveForm(),
                maxSeconds: maxSeconds,
                backToInitial: () {
                  setState(() {
                    _state = CurrentRecordingState.initial;
                    widget.showButton(false);
                  });
                },
              ),
      ),
    );
  }

  List<double> getWaveForm() {
    final durationSecs = _startedAt == null
        ? maxSeconds
        : max(0, DateTime.now().difference(_startedAt!).inMilliseconds) /
              1000.0;
    final expectedSamples =
        (durationSecs / amplitudeSampleEvery.inMilliseconds * 1000).round();
    final trimmed = _amplitudes
        .take(max(1, min(_amplitudes.length, expectedSamples)))
        .toList();
    return trimmed;
  }
}

class RecordingInitialWidget extends StatelessWidget {
  final void Function() startRecording;
  final void Function() stopRecording;
  final List<double> amplitudes;
  final String countDown;
  final bool recording;
  const RecordingInitialWidget({
    super.key,
    required this.startRecording,
    required this.stopRecording,
    required this.amplitudes,
    required this.countDown,
    required this.recording,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        !recording
            ? Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(AppLocalizations.of(context)!.holdMiroPhoneTitle),
              )
            : Expanded(
                child: Row(
                  children: [
                    Text('00:$countDown'),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CustomPaint(
                          painter: WaveformPainter(
                            samples: amplitudes,
                            maxBarHeight: AppSize.instance.height * 0.8,
                            // during recording, nothing is "played", so progress = null
                            progress: null,
                            barColor: Colors.black,
                            playedColor: Colors.blue, // ignored here
                          ),
                          size: const Size(double.infinity, double.infinity),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        Listener(
          onPointerDown: (_) => startRecording(),
          onPointerUp: (_) => stopRecording(),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppLightThemeColors.gradientFirstColor),
            ),
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(AppIcons.microphoneOnlyIcon),
          ),
        ),
      ],
    );
  }
}
