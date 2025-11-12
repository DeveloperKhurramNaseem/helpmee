import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_mee/util/constants/images.dart';

class EpHeaderImage extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final File? imageFile;
  const EpHeaderImage({
    super.key,
    required this.image,
    this.imageFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var radius = MediaQuery.sizeOf(context).height * 0.06;
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 20),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment(1, 1),
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2.5,
                    ),
                    // image: DecorationImage(
                    //   image: AssetImage(AppImages.placeHolderPerson),
                    // ),
                  ),
                  // padding: EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: radius,
                    backgroundColor: Colors.transparent,
                    backgroundImage: imageFile != null
                        ? FileImage(imageFile!)
                        : image.isNotEmpty
                        ? NetworkImage(image)
                        : AssetImage(AppImages.placeHolderPerson),
                    // child: Icon(Icons.person, size: 30),
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Icon(Icons.add_rounded, size: 25),
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
