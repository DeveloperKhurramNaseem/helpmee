import 'package:go_router/go_router.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/create_account_screen.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/enter_code_screen.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:help_mee/presentation/screens/home/dashboard/dashboard.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/activation_method_screen.dart';
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
        builder: (context, state) =>
            EnterCodeScreen(email: (state.extra as String?) ?? ''),
      ),
      GoRoute(
        path: ActivationMethodScreen.path,
        builder: (context, state) => ActivationMethodScreen(),
      ),
    ],
  );
}
