import 'package:flutter/material.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';

class CpFields extends StatelessWidget {
  const CpFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CpPasswordField(),
      CpConfirmPasswordField(),
    ],);
  }
}


class CpPasswordField extends StatelessWidget {
  const CpPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    var labelStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 14,
    );
    var isObscure = true;
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          decoration: InputDecoration(
            border: TextFieldsConstants.border,
            labelText: 'Password',
            helperText: '',
            focusedBorder: TextFieldsConstants.border,
            labelStyle: labelStyle,
            suffixIcon: GestureDetector(
              onTap: () => setState(() => isObscure = !isObscure),
              child: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).colorScheme.secondary.withAlpha(100),
              ),
            ),
          ),
          obscureText: isObscure,
          obscuringCharacter: TextFieldsConstants.obscuringCharacter,
          cursorColor: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }
}

class CpConfirmPasswordField extends StatelessWidget {
  const CpConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    var labelStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 14,
    );
    var isObscure = true;
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          decoration: InputDecoration(
            border: TextFieldsConstants.border,
            labelText: 'Confirm Password',
            helperText: '',
            focusedBorder: TextFieldsConstants.border,
            labelStyle: labelStyle,
            suffixIcon: GestureDetector(
              onTap: () => setState(() => isObscure = !isObscure),
              child: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).colorScheme.secondary.withAlpha(100),
              ),
            ),
          ),
          obscureText: isObscure,
          obscuringCharacter: TextFieldsConstants.obscuringCharacter,
          cursorColor: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }
}