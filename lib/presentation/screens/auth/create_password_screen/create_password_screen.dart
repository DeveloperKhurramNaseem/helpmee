import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/auth/create_password_bloc/create_password_bloc.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_arrow_back.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_button.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_error_text.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_fields.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_text.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:help_mee/util/constants/app_size.dart';

class CreatePasswordScreen extends StatefulWidget {
  static const path = '/create-password-screen';
  final String email;
  const CreatePasswordScreen({super.key, required this.email});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  late TextEditingController passwordController, confirmPasswordController;
  final GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>(),
      confirmPasswordKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CreatePasswordBloc, CreatePasswordState>(
        listener: _handleCreatePasswordBloc,
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
                  CpArrowBack(),
                  SizedBox(height: AppSize.instance.height * 0.05),
                  CpText(),
                  SizedBox(height: AppSize.instance.height * 0.02),
                  CpErrorText(),
                  SizedBox(height: AppSize.instance.height * 0.02),
                  CpFields(
                    passwordController: passwordController,
                    confirmationPasswordController: confirmPasswordController,
                    passwordKey: passwordKey,
                    confirmationPasswordKey: confirmPasswordKey,
                  ),
                  SizedBox(height: AppSize.instance.height * 0.01),
                  CpButton(
                    onPressed: () {
                      var createPasswordBloc = context
                          .read<CreatePasswordBloc>();
                      if (!(passwordKey.currentState?.validate() ?? false))
                        return;
                      if (!(confirmPasswordKey.currentState?.validate() ??
                          false))
                        return;
                      if (passwordController.text.length < 6) {
                        createPasswordBloc.add(
                          ShowErrorEvent(
                            AppLocalizations.of(context)!.errorPasswordTooShort,
                          ),
                        );
                        return;
                      }
                      if (passwordController.text.trim() !=
                          confirmPasswordController.text.trim()) {
                        createPasswordBloc.add(
                          ShowErrorEvent(
                            AppLocalizations.of(context)!.errorPasswordMismatch,
                          ),
                        );
                        return;
                      }

                      context.read<CreatePasswordBloc>().add(
                        CreateNewPasswordEvent(
                          email: widget.email,
                          password: passwordController.text.trim(),
                        ),
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

  void _handleCreatePasswordBloc(
    BuildContext context,
    CreatePasswordState state,
  ) {
    if (state is CreatePasswordDoneState) {
      context.go(SignInScreen.path);
    }
  }
}
