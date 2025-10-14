import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Color.fromRGBO(151, 0, 0, 0.8),
  );
}
