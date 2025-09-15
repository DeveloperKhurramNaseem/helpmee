import 'package:flutter/material.dart';

class AppSize {
  final double width;
  final double height;

  static AppSize? _instance;

  factory AppSize(Size size) {
    return _instance ??= AppSize._(height: size.height, width: size.width);
  }

  static AppSize get instance => _instance!;

  AppSize._({required this.height, required this.width});
}