import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: SignUpScreen.routeUrl,
    name: SignUpScreen.routeName,
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: LoginScreen.routeUrl,
    name: LoginScreen.routeName,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: InterestsScreen.routeUrl,
    name: InterestsScreen.routeName,
    builder: (context, state) => const InterestsScreen(),
  ),
  GoRoute(
    path: "/:tab(home|discover|inbox|profile)",
    name: MainNavigationScreen.routeName,
    builder: (context, state) {
      final tab = state.pathParameters['tab']!;

      return MainNavigationScreen(tab: tab);
    },
  ),
]);
