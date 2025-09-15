import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/icons.dart';

class CASocialLoginsRow extends StatelessWidget {
  const CASocialLoginsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Expanded(child: CASocialFbLoginButton()),
          Expanded(child: CASocialGoogleLoginButton()),
          Expanded(child: CASocialAppleLoginButton()),
          Spacer(),
        ],
      ),
    );
  }
}

class CASocialFbLoginButton extends StatelessWidget {
  const CASocialFbLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CASocialLoginButton(image: AppIcons.facebook, onPressed: () {});
  }
}

class CASocialGoogleLoginButton extends StatelessWidget {
  const CASocialGoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CASocialLoginButton(image: AppIcons.google, onPressed: () {});
  }
}

class CASocialAppleLoginButton extends StatelessWidget {
  const CASocialAppleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CASocialLoginButton(image: AppIcons.apple, onPressed: () {});
  }
}

class CASocialLoginButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  const CASocialLoginButton({
    super.key,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: SvgPicture.asset(image, width: 32, height: 32),
      ),
    );
  }
}
