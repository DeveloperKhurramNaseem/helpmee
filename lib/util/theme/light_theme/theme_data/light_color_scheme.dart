import 'package:flutter/material.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class LightColorScheme {
  static final ColorScheme data = ColorScheme(
    brightness: Brightness.light,
    primary: AppLightThemeColors.primaryColor,
    onPrimary: AppLightThemeColors.thirdColor,
    secondary: AppLightThemeColors.secondaryColor,
    onSecondary: AppLightThemeColors.thirdColor,
    error: AppLightThemeColors.errorColor,
    onError: AppLightThemeColors.thirdColor,
    surface: AppLightThemeColors.surfaceColor,
    onSurface: AppLightThemeColors.onSurfaceColor,
  );
}
