import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/images.dart';

class CAScreenContinueLine extends StatelessWidget {
  const CAScreenContinueLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 14),
      child: Row(
        children: [
          Expanded(child: SvgPicture.asset(AppImages.leftRect)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('or continue with'),
          ),
          Expanded(child: SvgPicture.asset(AppImages.rightRect)),
        ],
      ),
    );
  }
}
