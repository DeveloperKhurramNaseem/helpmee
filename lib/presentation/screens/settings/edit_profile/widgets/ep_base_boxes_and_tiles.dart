import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';

class EpInfoBaseBox extends StatelessWidget {
  final Widget child;
  final String titleText;
  final Color titleBorderColor, bodyBorderColor;
  final Color? titleBackgroundColor, titleColor;
  const EpInfoBaseBox({
    super.key,
    required this.titleText,
    required this.titleBorderColor,
    required this.bodyBorderColor,
    this.titleBackgroundColor,
    this.titleColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: bodyBorderColor),
              ),
              padding: EdgeInsets.fromLTRB(6, 25, 6, 10),
              child: child,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: titleBorderColor),
            color:
                titleBackgroundColor ??
                Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 4),
          child: Text(
            titleText,
            style: TextStyle(
              color: titleColor ?? Color.fromRGBO(0, 0, 0, 0.8),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}

class EpInfoBaseWithoutTitleBorderBox extends StatelessWidget {
  final Widget child;
  final String titleText;
  final Color titleBorderColor, bodyBorderColor;
  final Color? titleBackgroundColor, titleColor;
  const EpInfoBaseWithoutTitleBorderBox({
    super.key,
    required this.titleText,
    required this.titleBorderColor,
    required this.bodyBorderColor,
    this.titleBackgroundColor,
    this.titleColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(-0.9, -1),
      children: [
        SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: bodyBorderColor),
              ),
              padding: EdgeInsets.fromLTRB(6, 25, 6, 10),
              child: child,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
          child: Text(
            titleText,
            style: TextStyle(
              color: titleColor ?? Color.fromRGBO(0, 0, 0, 0.8),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}

class EpBaseAddTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const EpBaseAddTile({super.key, required this.title, required this.onTap});

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
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}

enum BaseTileState { simple, pdf, image }

class EpBaseTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onLockTap;
  final BaseTileState state;
  final String? image;
  final bool isLock;
  const EpBaseTile({
    super.key,
    required this.title,
    this.image,
    required this.state,
    required this.onTap,
    required this.onDeleteTap,
    required this.onEditTap,
    required this.onLockTap,
    this.isLock = false,
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
        child: Row(
          children: [
            if (state == BaseTileState.pdf || state == BaseTileState.image)
              Container(
                height: AppSize.instance.height * 0.065,
                decoration: BoxDecoration(
                  color: state == BaseTileState.image
                      ? Colors.transparent
                      : Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: state == BaseTileState.image
                      ? DecorationImage(
                          image: NetworkImage(image ?? ''),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    child: state == BaseTileState.pdf
                        ? SvgPicture.asset(AppIcons.pdf, width: 30)
                        : SizedBox(width: 30),
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Row(
              spacing: 10,
              children: [
                if (onEditTap != null)
                  GestureDetector(
                    onTap: onEditTap,
                    child: SvgPicture.asset(AppIcons.edit),
                  ),
                GestureDetector(
                  onTap: onDeleteTap,
                  child: SvgPicture.asset(
                    AppIcons.del,
                    color: onDeleteTap == null ? Colors.grey : null,
                  ),
                ),
                GestureDetector(
                  onTap: onLockTap,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      isLock ? AppIcons.locked : AppIcons.unlocked,
                      color: onLockTap == null ? Colors.grey : null,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
