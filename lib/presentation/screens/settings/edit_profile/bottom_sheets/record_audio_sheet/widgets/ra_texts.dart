import 'package:flutter/material.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class RaTitle extends StatelessWidget {
  final String text;
  const RaTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
      ],
    );
  }
}

class RaDetail extends StatelessWidget {
  final String text;
  const RaDetail({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppLightThemeColors.secondaryTextColor,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
