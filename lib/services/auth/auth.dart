import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ziyara_partner/services/auth/auth_exceptions.dart';

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
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      throw WeakPasswordAuthException();
    } else if (e.code == 'email-already-in-use') {
      throw EmailAlreadyInUseAuthException();
    } else if (e.code == 'invalid-email') {
      throw InvalidEmailAuthException();
    } else {
      throw GenericAuthException();
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
    print('User signed in: ${userCredential.user}');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      throw UserNotFoundAuthException();
    } else if (e.code == 'wrong-password') {
      throw WrongPasswordAuthException();
    } else {
      throw GenericAuthException();
    }
  } catch (_) {
    throw GenericAuthException();
  }
}
