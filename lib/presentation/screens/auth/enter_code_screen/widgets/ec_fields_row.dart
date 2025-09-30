import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';

class EcFieldsRow extends StatefulWidget {
  const EcFieldsRow({super.key});

  @override
  State<EcFieldsRow> createState() => _EcFieldsRowState();
}

class _EcFieldsRowState extends State<EcFieldsRow> {
  static const _spacer = 4, _fieldFlex = 15;
  late TextEditingController firstController,
      secondController,
      thirdController,
      fourthController,
      fifthController,
      sixthController;
  late FocusNode firstFocusNode,
      secondFocusNode,
      thirdFocusNode,
      fourthFocusNode,
      fifthFocusNode,
      sixthFocusNode;

  @override
  void initState() {
    super.initState();
    firstController = TextEditingController();
    secondController = TextEditingController();
    thirdController = TextEditingController();
    fourthController = TextEditingController();
    fifthController = TextEditingController();
    sixthController = TextEditingController();

    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();
    thirdFocusNode = FocusNode();
    fourthFocusNode = FocusNode();
    fifthFocusNode = FocusNode();
    sixthFocusNode = FocusNode();

    firstController.addListener(() {
      if (firstController.text.isNotEmpty) {
        secondFocusNode.requestFocus();
      }
      _updateCode();
    });

    secondController.addListener(() {
      if (secondController.text.isNotEmpty) {
        thirdFocusNode.requestFocus();
      }
      _updateCode();
    });

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
    // widget.onCodeChanged(
    //   '${firstController.text}${secondController.text}${thirdController.text}${fourthController.text}${fifthController.text}${sixthController.text}',
    // );
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    sixthController.dispose();
    firstFocusNode.dispose();
    secondFocusNode.dispose();
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
          // Spacer(flex: _spacer),
          Expanded(
            flex: _fieldFlex,
            child: EcTextField(
              focusNode: firstFocusNode,
              controller: firstController,
            ),
          ),
          Spacer(flex: _spacer),
          Expanded(
            flex: _fieldFlex,
            child: EcTextField(
              focusNode: secondFocusNode,
              controller: secondController,
            ),
          ),
          Spacer(flex: _spacer),
          Expanded(
            flex: _fieldFlex,
            child: EcTextField(
              focusNode: thirdFocusNode,
              controller: thirdController,
            ),
          ),
          Spacer(flex: _spacer),
          Expanded(
            flex: _fieldFlex,
            child: EcTextField(
              focusNode: fourthFocusNode,
              controller: fourthController,
            ),
          ),
          Spacer(flex: _spacer),
          Expanded(
            flex: _fieldFlex,
            child: EcTextField(
              focusNode: fifthFocusNode,
              controller: fifthController,
            ),
          ),
          Spacer(flex: _spacer),
          Expanded(
            flex: _fieldFlex,
            child: EcTextField(
              focusNode: sixthFocusNode,
              controller: sixthController,
            ),
          ),
          // Spacer(flex: _spacer),
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
        border: TextFieldsConstants.border,
        labelText: '',
        helperText: '',
        focusedBorder: TextFieldsConstants.focusedBorder,
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
