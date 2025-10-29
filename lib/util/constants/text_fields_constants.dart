import 'package:flutter/material.dart';

class TextFieldsConstants {
  static final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.black, width: 1),
  );
  static final dullBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.42), width: 1),
  );
  static final focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.black, width: 2),
  );

  static const obscuringCharacter = '*';

  static const genderValues = [1,2,3,4];  
  static const bloodGroupValues = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
}
