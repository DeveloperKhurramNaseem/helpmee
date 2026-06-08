import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class DatePickerSheet extends StatefulWidget {
  final void Function(DateTime newData) onDateTimeSelect;
  final DateTime initialDate;
  const DatePickerSheet({
    super.key,
    required this.initialDate,
    required this.onDateTimeSelect,
  });

  @override
  State<DatePickerSheet> createState() => _DatePickerSheetState();
}

class _DatePickerSheetState extends State<DatePickerSheet> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localization.selectDateTitel,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 220,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (dateTime) {
                  selectedDate = dateTime;
                },
                initialDateTime: widget.initialDate,
                minimumDate: DateTime.now().subtract(Duration(days: 365 * 100)),
                maximumDate: DateTime.now(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  child: AppButton(
                    onPressed: () {
                      widget.onDateTimeSelect(selectedDate);
                      Navigator.of(context).pop();
                    },
                    gradient: Theme.of(
                      context,
                    ).extension<AppGradients>()!.primaryButton,
                    child: Text(
                      localization.selectDatebtnTtitle,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  child: AppButtonNoBorder(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.cancelText,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
