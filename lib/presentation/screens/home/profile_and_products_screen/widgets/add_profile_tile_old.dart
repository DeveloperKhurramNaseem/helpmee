import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';

class AddProfileTileOld extends StatelessWidget {
  const AddProfileTileOld({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromRGBO(237, 237, 237, 1),
              width: 1,
            ),
            color: Color.fromRGBO(249, 249, 249, 0.55),
          ),
          child: Row(
            children: [
              Container(
                width: AppSize.instance.height * 0.1,
                height: AppSize.instance.height * 0.1,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Color.fromRGBO(237, 237, 237, 1),
                    width: 1,
                  ),
                  color: Color.fromRGBO(249, 249, 249, 0.55),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SvgPicture.asset(AppIcons.add)],
                ),
              ),
              Text(
                'Add Product',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
