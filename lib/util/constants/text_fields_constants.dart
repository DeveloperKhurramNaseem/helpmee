import 'package:flutter/material.dart';

class TextFieldsConstants {
  static final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.black, width: 1),
  );
  static final focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.black, width: 2),
  );
  static const obscuringCharacter = '*';
}
