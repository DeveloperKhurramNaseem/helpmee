import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showError(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.grey,
  );
}
