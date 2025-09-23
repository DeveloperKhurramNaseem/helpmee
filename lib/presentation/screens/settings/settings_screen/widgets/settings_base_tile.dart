import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsBaseTile extends StatelessWidget {
  final bool showIcon;
  final String titleText;
  final String image;
  final GestureTapCallback? onTap;
  final Widget? trailing;
  const SettingsBaseTile({
    super.key,
    this.showIcon = true,
    required this.titleText,
    required this.image,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        onTap: onTap,
        leading: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F6F6),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(image, width: 20),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        title: Text(titleText, style: TextStyle(fontWeight: FontWeight.w500)),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color.fromRGBO(0, 0, 0, 0.5),
          size: 20,
        ),
      ),
    );
  }
}
