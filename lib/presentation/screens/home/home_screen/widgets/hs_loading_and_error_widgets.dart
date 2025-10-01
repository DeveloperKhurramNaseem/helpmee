import 'package:flutter/material.dart';

class HsLoadingWidget extends StatelessWidget {
  const HsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverFillRemaining(
        child: Align(
          alignment: Alignment(0, -0.2),
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class HsErrorWidget extends StatelessWidget {
  final String message;
  const HsErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverToBoxAdapter(child: Center(child: Text(message))),
    );
  }
}
