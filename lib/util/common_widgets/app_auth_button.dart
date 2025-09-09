import 'package:flutter/material.dart';

class AppAuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;  

  const AppAuthButton({
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
        shadowColor: Colors.transparent, // Important
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,          
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
