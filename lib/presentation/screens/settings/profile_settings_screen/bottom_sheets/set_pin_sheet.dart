import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/domain/entities/pin_data.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/profile_settings/set_pin_bloc/set_pin_bloc.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class SetPinSheet extends StatefulWidget {
  final bool setPin;
  const SetPinSheet({super.key, this.setPin = true});

  @override
  State<SetPinSheet> createState() => _SetPinSheetState();
}

class _SetPinSheetState extends State<SetPinSheet> {
  String pinCode = '';
  late TextEditingController pinReminderTextController;

  @override
  void initState() {
    super.initState();
    pinReminderTextController = TextEditingController();
  }

  @override
  void dispose() {
    pinReminderTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.setPin ? localization.setPIN : localization.updatePIN,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Text(
              widget.setPin
                  ? localization.setPinDescription
                  : localization.updatePinDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.42),
                fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: EcFieldsRow(
              onUpdate: (value) {
                pinCode = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 12, right: 12),
            child: TextFormField(
              maxLines: 4,
              controller: pinReminderTextController,
              decoration: InputDecoration(
                border: TextFieldsConstants.dullBorder,
                enabledBorder: TextFieldsConstants.dullBorder,
                helperText: '',
                hintText: localization.pinReminderTextOptional,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.42),
                  fontSize: 12,
                ),
                fillColor: Color.fromRGBO(0, 0, 0, 0.42),
                focusedBorder: TextFieldsConstants.border,
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12,
                ),
              ),
              cursorColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: BlocBuilder<SetPinBloc, SetPinState>(
              builder: (context, state) {
                return AppButton(
                  onPressed: state is SetPinLoadingState
                      ? null
                      : () {
                          context.read<SetPinBloc>().add(
                            SetNewPinEvent(
                              setPin: widget.setPin,
                              pinData: PinData(
                                pin: pinCode,
                                pinReminderText: pinReminderTextController.text
                                    .trim(),                                    
                              ),
                            ),
                          );
                        },
                  gradient: Theme.of(
                    context,
                  ).extension<AppGradients>()!.primaryButton,
                  child: state is SetPinLoadingState
                      ? CupertinoActivityIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : Text(
                          widget.setPin
                              ? localization.set
                              : localization.update,
                          textAlign: TextAlign.center,
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EcFieldsRow extends StatefulWidget {
  final void Function(String value) onUpdate;
  const EcFieldsRow({super.key, required this.onUpdate});

  @override
  State<EcFieldsRow> createState() => _EcFieldsRowState();
}

class _EcFieldsRowState extends State<EcFieldsRow> {
  static const _spacer = 13, _fieldFlex = 20, _innerSpace = 8;
  late TextEditingController thirdController,
      fourthController,
      fifthController,
      sixthController;
  late FocusNode thirdFocusNode,
      fourthFocusNode,
      fifthFocusNode,
      sixthFocusNode;

  @override
  void initState() {
    super.initState();
    thirdController = TextEditingController();
    fourthController = TextEditingController();
    fifthController = TextEditingController();
    sixthController = TextEditingController();

    thirdFocusNode = FocusNode();
    fourthFocusNode = FocusNode();
    fifthFocusNode = FocusNode();
    sixthFocusNode = FocusNode();

    thirdController.addListener(() {
      if (thirdController.text.isNotEmpty) {
        fourthFocusNode.requestFocus();
      }
      _updateCode();
    });

    fourthController.addListener(() {
      if (fourthController.text.isNotEmpty) {
        fifthFocusNode.requestFocus();
      }
      _updateCode();
    });

    fifthController.addListener(() {
      if (fifthController.text.isNotEmpty) {
        sixthFocusNode.requestFocus();
      }
      _updateCode();
    });

    sixthController.addListener(() {
      if (sixthController.text.isNotEmpty) {
        sixthFocusNode.unfocus();
        _updateCode();
      }
      _updateCode();
    });
  }

  _updateCode() {
    widget.onUpdate(
      '${thirdController.text}${fourthController.text}${fifthController.text}${sixthController.text}',
    );
  }

  @override
  void dispose() {
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    sixthController.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    fifthFocusNode.dispose();
    sixthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Spacer(flex: _spacer),
          Expanded(
            flex: _fieldFlex,
            child: EcTextField(
              focusNode: thirdFocusNode,
              controller: thirdController,
            ),
          ),
          Spacer(flex: _innerSpace),
          Expanded(
            flex: _fieldFlex,
            child: EcTextField(
              focusNode: fourthFocusNode,
              controller: fourthController,
            ),
          ),
          Spacer(flex: _innerSpace),
          Expanded(
            flex: _fieldFlex,
            child: EcTextField(
              focusNode: fifthFocusNode,
              controller: fifthController,
            ),
          ),
          Spacer(flex: _innerSpace),
          Expanded(
            flex: _fieldFlex,
            child: EcTextField(
              focusNode: sixthFocusNode,
              controller: sixthController,
            ),
          ),
          Spacer(flex: _spacer),
        ],
      ),
    );
  }
}

class EcTextField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  const EcTextField({
    super.key,
    required this.focusNode,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var labelStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 14,
    );
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        border: TextFieldsConstants.dullBorder,
        enabledBorder: TextFieldsConstants.dullBorder,
        labelText: '',
        helperText: '',
        focusedBorder: TextFieldsConstants.border,
        labelStyle: labelStyle,
      ),
      cursorColor: Theme.of(context).colorScheme.secondary,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
