import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/create_account_screen.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/create_password_screen.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/enter_code_screen.dart';
import 'package:help_mee/presentation/screens/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:help_mee/presentation/screens/home/dashboard/dashboard.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/products_screen.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/activation_method_screen.dart';
import 'package:help_mee/presentation/screens/onboarding/scan_qr_code_screen/scan_qr_code_screen.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/settings_screen.dart';
import 'package:help_mee/presentation/screens/settings/change_password_screen/change_password_screen.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/edit_profile_screen.dart';
import 'package:help_mee/presentation/screens/settings/feedback_screen/feedback_screen.dart';
import 'package:help_mee/util/constants/profile_type_from_group_id.dart';
import 'package:help_mee/util/dependencies/init.dart';

bool isRedirected = false;

class Routing {
  static GoRouter routerConfig = GoRouter(
    redirect: (context, state) async {
      var token = await sl<TokenService>().getToken();
      if (token.isEmpty && !isRedirected) {
        isRedirected = true;
        return SignInScreen.path;
      }
      return null;
    },
    initialLocation: Dashboard.path,
    routes: [
      GoRoute(
        path: Dashboard.path,
        pageBuilder: (context, state) {
          var [showNameSheet, callProfile] =
              ((state.extra ?? [false, false]) as List);
          return MaterialPage(
            key: state.pageKey,
            child: Dashboard(
              showNameSheet: showNameSheet,
              callProfile: callProfile,
            ),
          );
        },
      ),
      GoRoute(
        path: SignInScreen.path,
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: CreateAccountScreen.path,
        builder: (context, state) => CreateAccountScreen(),
      ),
      GoRoute(
        path: EnterCodeScreen.path,
        builder: (context, state) {
          var [email, currentState] = (state.extra as List);
          return EnterCodeScreen(email: email, currentState: currentState);
        },
      ),
      GoRoute(
        path: ActivationMethodScreen.path,
        builder: (context, state) {
          var (token, activationState) =
              state.extra as (String, ActivationMethodState);
          return ActivationMethodScreen(
            token: token,
            activationMethodState: activationState,
          );
        },
      ),
      GoRoute(
        path: ScanQrCodeScreen.path,
        builder: (context, state) {
          var (token, activationState) =
              state.extra as (String, ActivationMethodState);
          return ScanQrCodeScreen(
            token: token,
            activationMethodState: activationState,
          );
        },
      ),
      GoRoute(
        path: CreatePasswordScreen.path,
        builder: (context, state) =>
            CreatePasswordScreen(email: state.extra as String),
      ),
      GoRoute(
        path: ChangePasswordScreen.path,
        builder: (context, state) => ChangePasswordScreen(),
      ),
      GoRoute(
        path: ForgotPasswordScreen.path,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: EditProfileScreen.path,
        builder: (context, state) => EditProfileScreen(
          profileType: (state.extra ?? ProfileType.personal) as ProfileType,
        ),
      ),
      GoRoute(
        path: SettingsScreen.path,
        builder: (context, state) => SettingsScreen(),
      ),
      GoRoute(
        path: ProductsScreen.path,
        builder: (context, state) => ProductsScreen(),
      ),
      GoRoute(
        path: FeedbackScreen.path,
        builder: (context, state) => FeedbackScreen(),
      ),
    ],
  );
}
