import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/icons.dart';

class FpArrowBack extends StatelessWidget {
  const FpArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 14.0, bottom: 14.0, right: 14.0),
        child: SvgPicture.asset(AppIcons.arrowBack),
      ),
    );
  }
}
