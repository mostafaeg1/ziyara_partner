import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ziyara_partner/firebase_options.dart';
import 'package:ziyara_partner/services/auth/auth_exceptions.dart';
import 'package:ziyara_partner/services/auth/auth_user.dart';



Future<void> signUp(TextEditingController emailController,
    TextEditingController passwordController) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    // User signed up successfully
    print('User signed up: ${userCredential.user}');

    await userCredential.user!.sendEmailVerification();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      throw WeakPasswordAuthException();
    } else if (e.code == 'email-already-in-use') {
      // throw EmailAlreadyInUseAuthException();
      print(e);
    } else if (e.code == 'invalid-email') {
      throw InvalidEmailAuthException();
    } else {
      print(e);
    }
    // Handle errors
  }
}

Future<void> logIN(TextEditingController emailController,
    TextEditingController passwordController) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    // User signed in successfully
    print('User sigasdasdsaned in: ${userCredential.user}');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      throw UserNotFoundAuthException();
    } else if (e.code == 'wrong-password') {
      throw WrongPasswordAuthException();
    } else {
      // throw GenericAuthException();
      print(e);
    }
  } catch (_) {
    throw GenericAuthException();
  }
}
