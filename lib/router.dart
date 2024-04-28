import 'package:go_router/go_router.dart';
import 'package:ziyara_partner/home_page.dart';
import 'package:ziyara_partner/views/appointments_view.dart';
import 'package:ziyara_partner/views/login_form.dart';
import 'package:ziyara_partner/views/signup_form.dart';
import 'package:ziyara_partner/views/user_home_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginFormValidation(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => const SignUpForm(),
    ),
    GoRoute(
      path: '/user_home_page',
      builder: (context, state) => const UserHomePage(),
    ),
    GoRoute(
      path: '/user_home_page/appointments',
      builder: (context, state) => Appointments(), // Replace AppointmentsPage with the appropriate widget
    ),
  ],
);