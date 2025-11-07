import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/painter/waveform_painter.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:just_audio/just_audio.dart';

class RecordingPlayerWidget extends StatefulWidget {
  final String? filePath;
  final List<double> waveform; // 0..1
  final int maxSeconds;
  final void Function() backToInitial;
  const RecordingPlayerWidget({
    super.key,
    required this.filePath,
    required this.waveform,
    required this.maxSeconds,
    required this.backToInitial,
  });

  @override
  State<RecordingPlayerWidget> createState() => _RecordingPlayerWidgetState();
}

class _RecordingPlayerWidgetState extends State<RecordingPlayerWidget> {
  final _player = AudioPlayer();
  StreamSubscription<Duration>? _posSub;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _loading = true;
  StreamSubscription<PlayerState>? _stateSub;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      await _player.setFilePath(widget.filePath!);
      _duration = _player.duration ?? Duration.zero;

      _stateSub = _player.playerStateStream.listen((state) async {
        if (state.processingState == ProcessingState.completed) {
          // Jump back to start and ensure we're paused
          await _player.seek(Duration.zero);
          await _player.pause();
          if (mounted) {
            setState(() {
              _position = Duration.zero; // keep UI in sync
            });
          }
        }
      });

      _posSub = _player.positionStream.listen((pos) {
        setState(() => _position = pos);
      });

      setState(() => _loading = false);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to load audio: $e')));
      }
    }
  }

  @override
  void dispose() {
    _posSub?.cancel();
    _player.dispose();
    _stateSub?.cancel(); //
    super.dispose();
  }

  double get _progressFrac {
    if (_duration.inMilliseconds == 0) return 0;
    final f = _position.inMilliseconds / _duration.inMilliseconds;
    return f.clamp(0.0, 1.0);
  }

  void _togglePlay() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      // Restart if at end
      if (_progressFrac >= 0.999) {
        await _player.seek(Duration.zero);
      }
      await _player.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final secondsLeft = max(0, (_duration - _position).inSeconds);
    // final countdown = secondsLeft.toString().padLeft(2, '0');
    dev.log(_loading.toString(), name: 'loading');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      children: [
        GestureDetector(
          onTap: () {
            _togglePlay();
          },
          child: _player.playing
              ? Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 5),
                  child: SvgPicture.asset(AppIcons.pauseIcon),
                )
              : Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppLightThemeColors.gradientFirstColor,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 5),
                  child: SvgPicture.asset(AppIcons.playIcon),
                ),
        ),
        Expanded(
          child: SizedBox(
            height: AppSize.instance.height * 0.065,
            child: CustomPaint(
              painter: WaveformPainter(
                samples: widget.waveform,
                progress: _loading ? 0 : _progressFrac,
                barColor: Colors.black,
                playedColor: Colors.grey,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.backToInitial();
          },
          child: SvgPicture.asset(AppIcons.del, height: 20, width: 20),
        ),
      ],
    );
      }
}
