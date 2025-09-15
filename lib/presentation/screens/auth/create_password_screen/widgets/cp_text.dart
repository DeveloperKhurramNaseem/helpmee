import 'package:flutter/material.dart';

class CpText extends StatelessWidget {
  const CpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Create Password',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Use at least 8 characters including letters and numbers',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary.withAlpha(150),
            ),
          ),
        ),
      ],
    );
  }
}