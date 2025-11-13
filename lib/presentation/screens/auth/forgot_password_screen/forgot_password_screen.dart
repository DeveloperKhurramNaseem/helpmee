import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/presentation/blocs/auth/forget_password/forget_password_bloc.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/enter_code_screen.dart';
import 'package:help_mee/presentation/screens/auth/forgot_password_screen/widgets/fp_back_arrow.dart';
import 'package:help_mee/presentation/screens/auth/forgot_password_screen/widgets/fp_error_text.dart';
import 'package:help_mee/presentation/screens/auth/forgot_password_screen/widgets/fp_field_and_button.dart';
import 'package:help_mee/presentation/screens/auth/forgot_password_screen/widgets/fp_text.dart';
import 'package:help_mee/util/constants/app_enums.dart';
import 'package:help_mee/util/constants/app_size.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const path = '/forget-password-screen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;
  final GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: _forgetPasswordListener,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 14.0,
              right: 14.0,
              top: MediaQuery.of(context).padding.top,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FpArrowBack(),
                  SizedBox(height: AppSize.instance.height * 0.05),
                  FpText(),
                  SizedBox(height: AppSize.instance.height * 0.02),
                  FpErrorText(),
                  SizedBox(height: AppSize.instance.height * 0.02),
                  FpFieldAndButton(
                    controller: emailController,
                    fieldKey: emailKey,
                    onPressed: () {
                      if (!(emailKey.currentState?.validate() ?? false)) return;
                      context.read<ForgetPasswordBloc>().add(
                        ForgetPasswordInitEvent(emailController.text.trim()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _forgetPasswordListener(
    BuildContext context,
    ForgetPasswordState state,
  ) {
    if (state is ForgetPasswordLoadedState) {
      context.push(
        EnterCodeScreen.path,
        extra: [
          emailController.text.trim(),
          EnterCodeScreenState.forgetPassword,
        ],
      );
    }
  }
}
