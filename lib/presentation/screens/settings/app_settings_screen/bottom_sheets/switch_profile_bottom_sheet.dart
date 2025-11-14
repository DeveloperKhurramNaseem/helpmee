
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';

class SwitchProfileBottomSheet extends StatelessWidget {
  const SwitchProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add/Switch Account',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          ProfileTile(
            name: 'Aleesha',
            email: 'aleesha@yopmail.com',
            imagePath: '',
            onTap: () {},
          ),
          AddProfileTile(title: 'Add Account', onTap: () {}),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String name, email, imagePath;
  final void Function() onTap;
  const ProfileTile({
    super.key,
    required this.name,
    required this.email,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSize.instance.height * 0.065,
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 249, 249, 0.55),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(237, 237, 237, 1), width: 1),
        ),
        margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          children: [
            CircleAvatar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 0.45),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Icon(
              Icons.check_circle,
              color: Theme.of(context).colorScheme.primary,
              size: 23,
            ),
          ],
        ),
      ),
    );
  }
}

class AddProfileTile extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const AddProfileTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSize.instance.height * 0.065,
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 249, 249, 0.55),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(237, 237, 237, 1), width: 1),
        ),
        margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Container(
                height: AppSize.instance.height * 0.065,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: SvgPicture.asset(AppIcons.add, width: 30),
              ),
            ),
            SizedBox(
              height: AppSize.instance.height * 0.065,
              child: VerticalDivider(
                color: Color.fromRGBO(237, 237, 237, 1),
                thickness: 1,
                width: 0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
