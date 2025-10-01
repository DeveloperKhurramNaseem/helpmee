import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/presentation/blocs/auth/signin/signin_bloc.dart';
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
  late TextEditingController emailController, passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                    SISpace(height: 0.05),
                    SiLogoBar(),
                    // Initial Text
                    SISpace(height: 0.11),
                    SIScreenLetsStart(),
                    SIScreenCreateAccount(),
                    // Error Text
                    SIScreenErrorText(),
                    // Input Fields
                    SIScreenTextEmailField(controller: emailController),
                    SIScreenTextPasswordField(controller: passwordController),
                    // Forgot password
                    SiForgetPassword(),
                    // Sign up button
                    SIScreenButton(
                      onPressed: () {
                        var bloc = context.read<SigninBloc>();
                        if (emailController.text.isEmpty) {
                          bloc.add(
                            ShowErrorEvent(message: 'Email is required'),
                          );
                          return;
                        }
                        if (passwordController.text.isEmpty) {
                          bloc.add(
                            ShowErrorEvent(message: 'Password is required'),
                          );
                          return;
                        }
                        context.read<SigninBloc>().add(
                          SignInUserEvent(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                      },
                    ),
                    SIScreenContinueLine(),
                    // Social Logins
                    SISocialLoginsRow(), // Sign in
                    SISignInLine(),
                    SISpace(height: 0.05),
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
