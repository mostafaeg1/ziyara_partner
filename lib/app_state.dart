import 'package:flutter/material.dart';
import 'package:ziyara_partner/services/auth/auth_provider.dart';
import 'package:ziyara_partner/services/auth/auth_user.dart';
import 'package:ziyara_partner/services/auth/firebase_auth_provider.dart';

class AppState extends ChangeNotifier {
  final TextEditingController _signUpEmailController = TextEditingController();
  final TextEditingController _signUpPasswordController =
      TextEditingController();
  String loginEmail = "";
  String loginPassword = "";
  String signupEmail = "";
  String signupPassword = "";
  AuthProvider provider = FirebaseAuthProvider();

  void updateLoginEmail(String email) {
    loginEmail = email;
    notifyListeners();
  }

  void updateLoginPassword(String password) {
    loginPassword = password;
    notifyListeners();
  }

  TextEditingController get signUpPasswordController =>
      _signUpPasswordController;
  TextEditingController get signUpEmailController => _signUpEmailController;

  String get getLoginEmail => loginEmail;
  String get getLoginPassword => loginPassword;
  String get getSignupEmail => signupEmail;
  String get getSignupPassword => signupPassword;
}

class AuthService {
  AuthProvider provider = FirebaseAuthProvider();
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );
}
