import 'package:flutter/material.dart';

class SettingsVersionText extends StatelessWidget {
  final String version;
  const SettingsVersionText({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        title: Text(
          version,
          style: TextStyle(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SettingsCategoryText extends StatelessWidget {
  final String category;
  const SettingsCategoryText({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        title: Text(
          category,
          style: TextStyle(fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Divider(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        indent: 12,
        endIndent: 12,
      ),
    );
  }
}
