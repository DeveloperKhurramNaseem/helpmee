import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_logo_bar.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_button.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_check_field.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_continue_line.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_text_fields.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_texts.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_signup_line.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_social_login_button.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_space.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/images.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppSize.instance.height,
          child: Stack(
            children: [
              SizedBox(
                height: AppSize.instance.height,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Builder(
                        builder: (context) {
                          return SvgPicture.asset(
                            AppImages.bottomClippedCircle,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.0,
                  right: 14.0,
                  top: MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Initial Texts
                    CaSpace(height: 0.05),
                    CaLogoBar(),
                    CaSpace(height: 0.06),
                    CaScreenLetsStart(),
                    CaScreenCreateAccount(),
                    // Error Text
                    CaScreenErrorText(hasError: false),

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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
