import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  final TextEditingController _signUpEmailController = TextEditingController();
  final TextEditingController _signUpPasswordController = TextEditingController();


  final TextEditingController _logInEmailController = TextEditingController();
  final TextEditingController _logINPasswordController = TextEditingController();

  TextEditingController get signUpPasswordController => _signUpPasswordController;
  TextEditingController get signUpEmailController => _signUpEmailController;

  TextEditingController get logINPasswordController => _logINPasswordController;
  TextEditingController get logInEmailController => _logInEmailController;

}
