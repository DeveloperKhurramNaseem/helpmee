import 'dart:io';

import 'package:flutter/services.dart';

class NativeSheet {
  static const MethodChannel _channel = MethodChannel('native_safari_sheet');

  static Future<void> open(String url) async {
    if (!Platform.isIOS && !Platform.isAndroid) return;
    await _channel.invokeMethod(
      Platform.isIOS ? 'openSafariSheet' : 'openChromeTab',
      {'url': url},
    );
  }
}
