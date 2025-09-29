import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/icons.dart';

class AddProfileTile extends StatelessWidget {
  const AddProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverToBoxAdapter(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 3),
          tileColor: Color.fromRGBO(249, 249, 249, 0.55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color.fromRGBO(237, 237, 237, 1), width: 1),
          ),
          leading: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color.fromRGBO(237, 237, 237, 1),
                width: 1,
              ),
              color: Color.fromRGBO(249, 249, 249, 0.55),
            ),
            child: SvgPicture.asset(AppIcons.add, width: 17),
          ),
          title: Text(
            'Add new profile',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
