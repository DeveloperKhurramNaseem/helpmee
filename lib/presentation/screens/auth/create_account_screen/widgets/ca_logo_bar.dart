import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:help_mee/util/constants/images.dart';

class CaLogoBar extends StatelessWidget {
  const CaLogoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [SvgPicture.asset(AppImages.logoBarImage)],
    );
  }
}
