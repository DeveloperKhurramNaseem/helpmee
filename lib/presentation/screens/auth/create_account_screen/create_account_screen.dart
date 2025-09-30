import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:help_mee/presentation/blocs/auth/signup/signup_bloc.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_logo_bar.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_button.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_check_field.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_continue_line.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_text_fields.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_screen_texts.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_signup_line.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_social_login_button.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/widgets/ca_space.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/enter_code_screen.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/images.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late TextEditingController emailController,
      passwordController,
      confirmPasswordController;

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: _signupBlocListener,
      child: Scaffold(
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
                      CaScreenErrorText(),

                      // Input Fields
                      CAScreenTextEmailField(controller: emailController),
                      CAScreenTextPasswordField(controller: passwordController),
                      CAScreenTextConfirmPasswordField(
                        controller: confirmPasswordController,
                      ),
                      // Check Field
                      StatefulBuilder(
                        builder: (context, setLocalState) {
                          return CAScreenCheckField(
                            isChecked: isChecked,
                            onChanged: (value) {
                              setLocalState(() {
                                isChecked = value!;
                              });
                            },
                          );
                        },
                      ),
                      // Sign up button
                      CAScreenButton(
                        onPressed: () {
                          final signUpBloc = context.read<SignupBloc>();
                          if (emailController.text.isEmpty) {
                            signUpBloc.add(ShowErrorEvent('Email is required'));
                            return;
                          }
                          if (passwordController.text.isEmpty) {
                            signUpBloc.add(
                              ShowErrorEvent('Password is required'),
                            );
                            return;
                          }

                          if (confirmPasswordController.text.isEmpty) {
                            signUpBloc.add(
                              ShowErrorEvent('All fields are required'),
                            );
                            return;
                          }
                          if (passwordController.text.trim() !=
                              confirmPasswordController.text.trim()) {
                            signUpBloc.add(
                              ShowErrorEvent('Passwords don\'t match'),
                            );
                            return;
                          }
                          if (!isChecked) {
                            signUpBloc.add(
                              ShowErrorEvent(
                                'Agree to privacy policy and terms and conditions',
                              ),
                            );
                            return;
                          }
                          context.read<SignupBloc>().add(
                            SignUpUserEvent(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            ),
                          );
                        },
                      ),
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
      ),
    );
  }

  void _signupBlocListener(BuildContext context, SignupState state) {
    if (state is SignupDoneState) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => EnterCodeScreen()));
    }
  }
}
