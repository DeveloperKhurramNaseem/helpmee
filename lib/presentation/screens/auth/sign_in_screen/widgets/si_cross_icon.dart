import 'package:flutter/material.dart';

class SICrossIcon extends StatelessWidget {
  const SICrossIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFFA4A4A4).withOpacity(0.3),
      child: Icon(
        Icons.close_rounded,
        color: Color.fromARGB(255, 138, 138, 138),
      ),
    );
  }
}
