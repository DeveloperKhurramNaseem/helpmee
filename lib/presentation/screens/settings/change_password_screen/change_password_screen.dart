import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/change_password/change_password_bloc.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_arrow_back.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_error_text.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_text.dart';
import 'package:help_mee/presentation/screens/settings/change_password_screen/widgets/cpp_button.dart';
import 'package:help_mee/presentation/screens/settings/change_password_screen/widgets/cpp_password_fields.dart';
import 'package:help_mee/util/common_widgets/show_toast.dart';
import 'package:help_mee/util/constants/app_size.dart';

/*
This screen is similar to Create password screen located at screens/auth/create_password_screen.dart
So I am using the same widgets from that screen instead of creating new ones. Except the fields combining widget
I have created a new widget just to use three fields instead of two.... 
Whenever changes are required on this screen keep this in mind :)
*/

class ChangePasswordScreen extends StatefulWidget {
  static const path = '/change-password-screen';
  
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController currentPasswordController,
      newPasswordController,
      confirmPasswordController;
  final GlobalKey<FormFieldState> currentPasswordKey =
          GlobalKey<FormFieldState>(),
      newPasswordKey = GlobalKey<FormFieldState>(),
      confirmPasswordKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listener: _handleChangePasswordBloc,
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
                  CppFields(
                    currentPasswordController: currentPasswordController,
                    currentPasswordKey: currentPasswordKey,
                    passwordController: newPasswordController,
                    confirmationPasswordController: confirmPasswordController,
                    passwordKey: newPasswordKey,
                    confirmationPasswordKey: confirmPasswordKey,
                  ),
                  SizedBox(height: AppSize.instance.height * 0.01),
                  CppButton(
                    onPressed: () {
                      var createPasswordBloc = context
                          .read<ChangePasswordBloc>();
                      if (!(currentPasswordKey.currentState?.validate() ?? false))
                        return;
                      if (!(newPasswordKey.currentState?.validate() ?? false))
                        return;
                      if (!(confirmPasswordKey.currentState?.validate() ??
                          false))
                        return;
                      if (newPasswordController.text.length < 6) {
                        createPasswordBloc.add(
                          ShowErrorEvent(
                            message: 
                            AppLocalizations.of(context)!.errorPasswordTooShort,
                          ),
                        );
                        return;
                      }
                      if (newPasswordController.text.trim() !=
                          confirmPasswordController.text.trim()) {
                        createPasswordBloc.add(
                          ShowErrorEvent(
                            message: 
                            AppLocalizations.of(context)!.errorPasswordMismatch,
                          ),
                        );
                        return;
                      }

                      context.read<ChangePasswordBloc>().add(
                        ChangeCurrentPasswordEvent(
                          currentPassword: currentPasswordController.text.trim(),
                          newPassword: newPasswordController.text.trim(),                          
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

  void _handleChangePasswordBloc(
    BuildContext context,
    ChangePasswordState state,
  ) {
    if (state is ChangePasswordDoneState) {
      currentPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
      showToast(state.message);
    } else if (state is ChangePasswordErrorState) {
      showToast(state.error);
    }
  }
}
