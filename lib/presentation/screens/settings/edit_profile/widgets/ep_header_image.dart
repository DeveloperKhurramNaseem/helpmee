import 'package:flutter/material.dart';

class EpHeaderImage extends StatelessWidget {
  const EpHeaderImage({super.key});

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
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: radius,
                    child: Icon(Icons.person, size: 30),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    shape: BoxShape.circle,
                  ),

                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Icon(Icons.add_rounded, size: 25),
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
