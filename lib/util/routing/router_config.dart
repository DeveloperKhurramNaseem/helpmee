import 'package:go_router/go_router.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/create_account_screen.dart';

class Routing{
  static GoRouter routerConfig = GoRouter(
    initialLocation: '/',    
    routes: [
    GoRoute(path: '/' , builder: (context, state) => CreateAccountScreen(),),
  ]);
}