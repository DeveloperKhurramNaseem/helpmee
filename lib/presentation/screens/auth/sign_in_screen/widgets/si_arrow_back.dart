import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/icons.dart';

class SiArrowBack extends StatelessWidget {
  const SiArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      Navigator.pop(context);
    },child: SvgPicture.asset(AppIcons.arrowBack));
  }
}
