import 'package:flutter/material.dart';
import 'package:help_mee/util/constants/app_size.dart';

class AmAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AmAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.arrow_back),
            ),
          ),
          Text(
            'Choose Activation Method',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(AppSize.instance.width, kToolbarHeight);
}
