import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: SignUpScreen.routeUrl,
    name: SignUpScreen.routeName,
    builder: (context, state) => const SignUpScreen(),
    routes: [
      GoRoute(
          path: UsernameScreen.routeUrl,
          name: UsernameScreen.routeName,
          builder: (context, state) => const UsernameScreen(),
          routes: [
            GoRoute(
              path: EmailScreen.routeUrl,
              name: EmailScreen.routeName,
              builder: (context, state) {
                final args = state.extra as EmailScreenArgs;

                return EmailScreen(username: args.username);
              },
            ),
          ]),
    ],
  ),
  // GoRoute(
  //   path: LoginScreen.routeName,
  //   builder: (context, state) => const LoginScreen(),
  // ),
  GoRoute(
    path: '/user/:username',
    builder: (context, state) => const UserProfileScreen(),
  ),
]);
