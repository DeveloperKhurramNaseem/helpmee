import 'package:flutter/material.dart';

class NotificationsText extends StatelessWidget {
  final String text;
  const NotificationsText({super.key , required this.text});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }
}
