import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_arrow_back.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_forget_password.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_screen_button.dart';

import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_screen_continue_line.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_screen_text_fields.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_screen_texts.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_signup_line.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_social_login_button.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/widgets/si_space.dart';
import 'package:help_mee/util/constants/app_size.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    var heightPercent = 0.28;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -279.95,
            left: -38.7,
            child: CircleAvatar(
              // radius: 220,
              radius: AppSize.instance.height * heightPercent,
              backgroundColor: Color(0xFFA4A4A4).withOpacity(0.3),
            ),
          ),
          Positioned(
            top: -312.27,
            left: 148.72,
            child: CircleAvatar(
              radius: AppSize.instance.height * heightPercent,
              backgroundColor: Color(0xFFA4A4A4).withOpacity(0.6),
              // backgroundColor: Colors.red,
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
                  // Initial Texts
                  SISpace(height: 0.02),
                  SiArrowBack(),
                  SISpace(height: 0.16),
                  SIScreenLetsStart(),
                  SIScreenCreateAccount(),
                  // Error Text
                  SIScreenErrorText(hasError: true),
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
    );
  }
}
