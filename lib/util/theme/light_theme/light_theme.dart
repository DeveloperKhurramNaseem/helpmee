import 'package:flutter/material.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_color_scheme.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_text_theme.dart';

class LightTheme {
  static final ThemeData data = ThemeData(
    colorScheme: LightColorScheme.data,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        overlayColor: WidgetStatePropertyAll(
          AppLightThemeColors.secondaryColor.withAlpha(80),
        ),
      ),
    ),
    fontFamily: 'Poppins',
    textTheme: LightTextTheme.data,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppLightThemeColors.secondaryColor.withAlpha(80),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: true,                // show the default handle
      dragHandleColor: AppLightThemeColors.secondaryColor.withAlpha(80),  // customize color
      dragHandleSize: Size(56, 4),         // width, height
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    ),
    splashColor: AppLightThemeColors.secondaryColor.withAlpha(100),
    extensions: [
      AppGradients(
        primaryButton: const LinearGradient(
          colors: [
            AppLightThemeColors.gradientFirstColor,
            AppLightThemeColors.gradientSecondColor,
          ],
        ),
      ),
    ],
  );
}
