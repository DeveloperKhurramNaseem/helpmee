import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class FancyWaveformPainter extends CustomPainter {
  final Duration position;
  final Duration duration;
  final List<double> amps;

  FancyWaveformPainter({
    required this.position,
    required this.duration,
    required this.amps,
  });

  @override
  void paint(Canvas canvas, Size size) {
    log('Width : ${size.width}, Height : ${size.height}');
    log('Amps Length: ${amps.length}');
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final activePaint = Paint()
      ..color = AppLightThemeColors.gradientFirstColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final spacing = 2.5;
    final barWidth = 1;
    final count = (size.width / (barWidth + spacing)).floor();
    log('Count: $count');
    var downloadedAmps = getDownsampledAmplitudes(amps, count);
    log('Downloaded Amps: $downloadedAmps');
    var normalizedAmps = normalize(downloadedAmps, 25);
    final progressRatio = duration.inMilliseconds == 0
        ? 0.0
        : position.inMilliseconds / duration.inMilliseconds;

    for (int i = 0; i < normalizedAmps.length; i++) {
      final x = i * (barWidth + spacing);
      // final height = Random(i).nextDouble() * size.height;
      final isActive = i / normalizedAmps.length < progressRatio;
      paint.color = AppLightThemeColors.secondaryColor;
      log(
        'X : $x, Y: ${size.height / 2 - normalizedAmps[i] / 2}, Normalized Amps: ${normalizedAmps[i] / 2} Active: $isActive',
      );
      canvas.drawLine(
        Offset(x, size.height / 2 - normalizedAmps[i] / 2),
        Offset(x, size.height / 2 + normalizedAmps[i] / 2),
        isActive ? activePaint : paint,
      );
    }
  }

  List<double> getDownsampledAmplitudes(List<double> input, int targetSize) {
    int chunkSize = (input.length / targetSize).floor();

    log('Chunk Size: $chunkSize');
    List<double> downsampled = [];

    for (int i = 0; i < targetSize; i++) {
      int start = i * chunkSize;
      int end = (i + 1) * chunkSize;
      if (end > input.length) end = input.length;

      // Get chunk
      var chunk = input.sublist(start, end);

      // Calculate max or average amplitude in chunk
      double maxAmplitude = chunk.isNotEmpty
          ? chunk.reduce((a, b) => a > b ? a : b)
          : 0;

      downsampled.add(maxAmplitude);
    }

    return downsampled;
  }

  List<double> normalize(List<double> values, [double scaleTo = 100]) {
    if (values.isEmpty) return [];
    double maxVal = values.reduce((a, b) => a > b ? a : b);
    return values.map((v) => (v / maxVal) * scaleTo).toList();
  }

  @override
  bool shouldRepaint(covariant FancyWaveformPainter oldDelegate) {
    return oldDelegate.position != position || oldDelegate.duration != duration;
  }
}
