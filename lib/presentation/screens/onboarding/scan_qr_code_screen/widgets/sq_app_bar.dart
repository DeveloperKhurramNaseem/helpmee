import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';

class SqAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() onTorchTap;
  const SqAppBar({super.key, required this.onTorchTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Text(
                'Scan QR Code',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          GestureDetector(
            onTap: onTorchTap,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              child: SvgPicture.asset(AppIcons.torch),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(AppSize.instance.width, kToolbarHeight);
}
