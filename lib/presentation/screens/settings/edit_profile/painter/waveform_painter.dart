
import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
/// Simple bar waveform painter with progress tint


class WaveformPainter extends CustomPainter {
  final List<double> samples; // 0..1
  final double? progress; // 0..1 (null when recording)
  final Color barColor;
  final Color playedColor;

  WaveformPainter({
    required this.samples,
    required this.progress,
    required this.barColor,
    required this.playedColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintUnplayed = Paint()
      ..color = barColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    final paintPlayed = Paint()
      ..color = playedColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    dev.log(samples.toString(), name: 'amps');

    if (samples.isEmpty) return;

    // We’ll render at most N bars to fit the width nicely.
    // If there are more samples, down-sample by picking every kth sample.
    final barGap = 3.0; // px between bars
    final barWidth = 3.0;
    final stride = (barWidth + barGap);
    final maxBars = (size.width / stride).floor().clamp(1, 4000);

    final step = max(1, (samples.length / maxBars).floor());
    final reduced = <double>[];
    for (int i = 0; i < samples.length; i += step) {
      // Take max in the bucket for punchier look
      final end = min(i + step, samples.length);
      final bucketMax = samples
          .sublist(i, end)
          .fold<double>(0.0, (m, v) => v > m ? v : m);
      reduced.add(bucketMax);
    }

    final bars = reduced.length;
    final centerY = size.height / 2;
    final maxBarHeight = size.height * 0.8;

    final progressBars = progress == null ? -1 : (bars * progress!).floor();

    for (int i = 0; i < bars; i++) {
      final x = i * stride + barWidth / 2;
      if (x > size.width) break;

      // Map sample (0..1) to bar height
      final h = max(2.0, maxBarHeight * reduced[i]);
      final y1 = centerY - h / 2;
      final y2 = centerY + h / 2;

      final paint = (progressBars > 0 && i <= progressBars)
          ? paintPlayed
          : paintUnplayed;
      canvas.drawLine(Offset(x, y1), Offset(x, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant WaveformPainter oldDelegate) {
    return true;
  }
}
