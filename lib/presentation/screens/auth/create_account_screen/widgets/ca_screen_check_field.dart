import 'package:flutter/material.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class CAScreenCheckField extends StatelessWidget {
  const CAScreenCheckField({super.key});

  @override
  Widget build(BuildContext context) {
    var fontSize = 14.0;
    var isChecked = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StatefulBuilder(
          builder: (context, setState) {
            return Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() => isChecked = value!);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(width: 0.2),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              fillColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppLightThemeColors.blue;
                }
                return Colors.transparent;
              }),
              checkColor: Colors.white,
              overlayColor: WidgetStatePropertyAll(Colors.white),
            );
          },
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Agree to ',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              TextSpan(
                text: 'Privacy Policy ',
                style: TextStyle(
                  color: AppLightThemeColors.blue,
                  fontSize: fontSize,
                ),
              ),
              TextSpan(
                text: 'and ',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              TextSpan(
                text: 'Terms & Conditions',
                style: TextStyle(
                  color: AppLightThemeColors.blue,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
