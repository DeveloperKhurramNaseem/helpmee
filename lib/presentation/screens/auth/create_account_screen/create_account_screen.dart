import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_button.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_check_field.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_continue_line.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_text_fields.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_texts.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_signup_line.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_social_login_button.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_space.dart';
import 'package:help_mee/util/constants/app_size.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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
                right: 14,
                top: MediaQuery.of(context).padding.top,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Initial Texts
                  CaSpace(height: 0.2),
                  CaScreenLetsStart(),
                  CaScreenCreateAccount(),
                  // Error Text
                  CaScreenErrorText(hasError: true),
                  // Input Fields
                  CAScreenTextEmailField(),
                  CAScreenTextPasswordField(),
                  CAScreenTextConfirmPasswordField(),
                  // Check Field
                  CAScreenCheckField(),
                  // Sign up button
                  CAScreenButton(),
                  CAScreenContinueLine(),
                  // Social Logins
                  CASocialLoginsRow(),
                  // Sign in
                  CASignInLine(),
                  CaSpace(height: 0.05),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
