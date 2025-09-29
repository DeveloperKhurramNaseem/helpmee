import 'package:flutter/material.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class LightSwitchTheme {
  static SwitchThemeData data = SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      return AppLightThemeColors.surfaceColor;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppLightThemeColors.primaryColor;
      }
      return Color.fromRGBO(217, 217, 217, 1);
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppLightThemeColors.primaryColor;
      }
      return Color.fromRGBO(217, 217, 217, 1);
    }),
  );
}
