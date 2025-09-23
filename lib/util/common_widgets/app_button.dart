import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Gradient? gradient;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.gradient = const LinearGradient(
      colors: [Color(0xFF4CAF50), Color(0xFF81C784)], // Default green gradient
    ),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.transparent, // Important
        shadowColor: Colors.transparent, // Important
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}

class AppButtonOutlined extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const AppButtonOutlined({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.transparent, // Important
        foregroundColor: Theme.of(context).colorScheme.secondary,
        shadowColor: Colors.transparent, // Important
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withAlpha(100),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}

class AppButtonNoBorder extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const AppButtonNoBorder({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        splashFactory: NoSplash.splashFactory,
        backgroundColor: Colors.transparent, // Important
        foregroundColor: Theme.of(context).colorScheme.secondary,
        shadowColor: Colors.transparent, // Important
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}
