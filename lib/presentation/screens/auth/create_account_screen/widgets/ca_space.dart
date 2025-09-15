import 'package:flutter/material.dart';
import 'package:help_mee/util/constants/app_size.dart';

class CaSpace extends StatelessWidget {
  final double height;
  const CaSpace({super.key , required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.instance.height * height,
    );
  }
}