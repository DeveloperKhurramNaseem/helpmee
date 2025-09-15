import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/icons.dart';

class SISocialLoginsRow extends StatelessWidget {
  const SISocialLoginsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Expanded(child: SISocialFbLoginButton()),
          Expanded(child: SISocialGoogleLoginButton()),
          Expanded(child: SISocialAppleLoginButton()),
          Spacer(),
        ],
      ),
    );
  }
}

class SISocialFbLoginButton extends StatelessWidget {
  const SISocialFbLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SISocialLoginButton(image: AppIcons.facebook, onPressed: () {});
  }
}

class SISocialGoogleLoginButton extends StatelessWidget {
  const SISocialGoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SISocialLoginButton(image: AppIcons.google, onPressed: () {});
  }
}

class SISocialAppleLoginButton extends StatelessWidget {
  const SISocialAppleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SISocialLoginButton(image: AppIcons.apple, onPressed: () {});
  }
}

class SISocialLoginButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  const SISocialLoginButton({
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
