import 'package:help_mee/domain/entities/pin_data.dart';

class PinDataModel extends PinData {
  static const pinKey = 'pin_code';
  static const pinReminderTextKey = 'pin_code_reminder_text';

  PinDataModel({required super.pin, required super.pinReminderText});

  factory PinDataModel.fromJson(Map<String, dynamic> json) {
    return PinDataModel(
      pin: json[pinKey],
      pinReminderText: json[pinReminderTextKey],
    );
  }

  factory PinDataModel.fromPinData(PinData pinData) {
    return PinDataModel(
      pin: pinData.pin,
      pinReminderText: pinData.pinReminderText,
    );
  }

  Map<String, dynamic> toMap() {
    return {pinKey: pin, pinReminderTextKey: pinReminderText};
  }
}
