import 'package:flutter/material.dart';

class AppGradients extends ThemeExtension<AppGradients> {
  final Gradient primaryButton;

  const AppGradients({required this.primaryButton});

  @override
  AppGradients copyWith({Gradient? primaryButton}) {
    return AppGradients(
      primaryButton: primaryButton ?? this.primaryButton,
    );
  }

  @override
  AppGradients lerp(ThemeExtension<AppGradients>? other, double t) {
    if (other is! AppGradients) return this;
    return AppGradients(primaryButton: other.primaryButton);
  }
}
