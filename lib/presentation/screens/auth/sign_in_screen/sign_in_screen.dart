import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_forget_password.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_logo_bar.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_screen_button.dart';

import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_screen_continue_line.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_screen_text_fields.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_screen_texts.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_signup_line.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_social_login_button.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_space.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/images.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: AppSize.instance.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Builder(
                builder: (context) {
                  final kb = MediaQuery.of(context).viewInsets.bottom;
                  return Transform.translate(
                    offset: Offset(0, kb),
                    child: SvgPicture.asset(AppImages.bottomClippedCircle),
                  );
                },
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 14.0,
                  right: 14.0,
                  top: MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SISpace(height: 0.05),
                    SiLogoBar(),
                    // Initial Text
                    SISpace(height: 0.11),
                    SIScreenLetsStart(),
                    SIScreenCreateAccount(),
                    // Error Text
                    SIScreenErrorText(hasError: false),
                    // Input Fields
                    SIScreenTextEmailField(),
                    SIScreenTextPasswordField(),
                    // Forgot password
                    SiForgetPassword(),
                    // Sign up button
                    SIScreenButton(),
                    SIScreenContinueLine(),
                    // Social Logins
                    SISocialLoginsRow(), // Sign in
                    SISignInLine(),
                    SISpace(height: 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
