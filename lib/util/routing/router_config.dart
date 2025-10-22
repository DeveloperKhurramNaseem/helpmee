import 'package:go_router/go_router.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/create_account_screen.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/create_password_screen.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/enter_code_screen.dart';
import 'package:help_mee/presentation/screens/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:help_mee/presentation/screens/home/dashboard/dashboard.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/activation_method_screen.dart';
import 'package:help_mee/presentation/screens/onboarding/scan_qr_code_screen/scan_qr_code_screen.dart';
import 'package:help_mee/presentation/screens/settings/change_password_screen/change_password_screen.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/edit_profile_screen.dart';
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
        builder: (context, state) =>
            Dashboard(showNameSheet: (state.extra as bool?) ?? false),
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
        builder: (context, state) =>
            ActivationMethodScreen(token: state.extra as String),
      ),
      GoRoute(
        path: ScanQrCodeScreen.path,
        builder: (context, state) =>
            ScanQrCodeScreen(token: state.extra as String),
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
      GoRoute(path: EditProfileScreen.path , builder: (context, state) => EditProfileScreen()),
    ],
  );
}
