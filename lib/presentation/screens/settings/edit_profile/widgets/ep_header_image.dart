import 'package:flutter/material.dart';

class EpHeaderImage extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  const EpHeaderImage({super.key, required this.image, required this.onTap});

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
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  padding: EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: radius,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    backgroundImage: NetworkImage(image),
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
