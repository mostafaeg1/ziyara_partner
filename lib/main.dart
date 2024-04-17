import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home_page.dart';

void main() {
  runApp(const MainApp());
}


final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>const  HomePage(),
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Firebase Meetup',
      
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
