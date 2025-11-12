import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/record_audio_sheet/record_audio_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/painter/waveform_painter.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_waveform/just_waveform.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class EpVoiceNote extends StatefulWidget {
  final String url;
  const EpVoiceNote({super.key, required this.url});

  @override
  State<EpVoiceNote> createState() => _EpVoiceNoteState();
}

class _EpVoiceNoteState extends State<EpVoiceNote> {
  final _player = AudioPlayer();
  StreamSubscription<Duration>? _posSub;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _loading = true;
  StreamSubscription<PlayerState>? _stateSub;
  List<double> _bars = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      final barsFuture = getWaveformForUrl(widget.url, maxBars: 240);
      await _player.setUrl(widget.url);
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

      final bars = await barsFuture;
      if (!mounted) return;
      setState(() => _bars = bars);

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

  /// Creates/returns a compact waveform (0..1) for an audio URL.
  /// - Downloads URL to temp (if not cached)
  /// - Extracts waveform with `just_waveform` (if not cached)
  /// - Reduces to <= maxBars values (bucketed max abs amplitude)
  Future<List<double>> getWaveformForUrl(
    String url, {
    int pixelsPerSecond = 100, // higher = more detail (and bigger .wave file)
    int maxBars = 240, // how many bars you want to paint
  }) async {
    final tmp = await getTemporaryDirectory();
    final urlKey = base64Url.encode(utf8.encode(url)); // cache key
    final audioPath = '${tmp.path}/aud_$urlKey.m4a';
    final wavePath = '${tmp.path}/aud_$urlKey.wave'; // just_waveform cache
    final jsonPath = '${tmp.path}/aud_$urlKey.json'; // our reduced bars cache

    // 1) If we already have reduced bars, return them
    final jsonFile = File(jsonPath);
    // if (await jsonFile.exists()) {
    //   final data = jsonDecode(await jsonFile.readAsString()) as List;
    //   return data.map((e) => (e as num).toDouble()).toList();
    // }

    // 2) Ensure audio file exists (download if missing)

    final audioFile = File(audioPath);
    if (!await audioFile.exists()) {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode != 200) {
        throw Exception('Failed to download audio (${res.statusCode})');
      }
      await audioFile.writeAsBytes(res.bodyBytes);
    }

    // 3) Extract waveform (stream yields progress; we await the final one)
    Waveform? waveform;
    final stream = JustWaveform.extract(
      audioInFile: audioFile,
      waveOutFile: File(wavePath),
      //  pixels per second is a logical density for the produced wave file
      zoom: WaveformZoom.pixelsPerSecond(pixelsPerSecond),
    );

    await for (final p in stream) {
      if (p.waveform != null) waveform = p.waveform;
    }
    if (waveform == null) throw Exception('Waveform extraction failed');

    // 4) Reduce to <= maxBars by bucketing and taking max absolute amplitude
    //    `waveform.samples` are PCM floats in [-1..1] (already normalized).
    final raw = waveform.data;
    const denom = 32768.0; // Int16 max magnitude
    final samples = List<double>.generate(
      raw.length,
      (i) => (raw[i].toDouble() / denom).clamp(-1.0, 1.0),
    ); // Float64List
    final total = samples.length;
    final bucketSize = max(1, (total / maxBars).ceil());
    final reduced = <double>[];
    for (int i = 0; i < total; i += bucketSize) {
      final end = min(i + bucketSize, total);
      double m = 0;
      for (int j = i; j < end; j++) {
        final v = samples[j].abs();
        if (v > m) m = v;
      }
      // Map [-1..1] magnitude to [0..1], with a tiny floor so silence is visible
      reduced.add(m.clamp(0.0, 1.0));
    }

    // 5) Persist reduced bars for next time
    await jsonFile.writeAsString(json.encode(reduced));

    return reduced;
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
                samples: _bars,
                progress: _loading ? 0 : _progressFrac,
                barColor: Colors.black,
                playedColor: Colors.grey,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              builder: (context) {
                return RecordAudioSheet(url: widget.url , amps: _bars,);
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.only(right: 5),
            child: SvgPicture.asset(AppIcons.edit, height: 20, width: 20),
          ),
        ),
      ],
    );
  }
}
