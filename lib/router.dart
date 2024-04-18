import 'package:go_router/go_router.dart';

import 'home_page.dart';
import 'sign_up_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'sign_up',
          builder: (context, state) => const SignUpPage(),
        )
      ],
    ),
  ],
);
