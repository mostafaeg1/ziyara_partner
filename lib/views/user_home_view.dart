import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ziyara_partner/home_page.dart';
import 'package:ziyara_partner/router.dart';
import 'package:ziyara_partner/views/appointments_view.dart';
import 'package:ziyara_partner/views/profile.dart';
import 'package:ziyara_partner/views/settings_view.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _currentIndex = 0; // Index of the active BottomNavigationBarItem

  final List<Widget> _screens = [
    const Appointments(),
    const Settings(),
    const Profile(),
  ];

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            router.go("/");
          },
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
