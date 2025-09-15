import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/images.dart';

class SiLogoBar extends StatelessWidget {
  const SiLogoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [SvgPicture.asset(AppImages.logoBarImage)],
    );
  }
}