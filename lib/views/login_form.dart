import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:ziyara_partner/app_state.dart';
import 'package:ziyara_partner/home_page.dart';
import 'package:ziyara_partner/main.dart';
import 'package:ziyara_partner/router.dart';
import 'package:ziyara_partner/services/auth/auth.dart';

class LoginFormValidation extends StatefulWidget {
  @override
  LoginFormValidationState createState() => LoginFormValidationState();
}

class LoginFormValidationState extends State<LoginFormValidation> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text("Ziyara Partner")),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode
              .onUserInteraction, //check for validation while typing
          key: formkey,
          child: Column(
            children: <Widget>[
              const Illustration(),
              const EmailField(),
              const PasswordField(),
              const SizedBox(height: 15),
              const ForgotPasswordLabel(),
              const SizedBox(
                height: 30,
              ),
              LoginButton(formkey: formkey),
              const SizedBox(
                height: 70,
              ),
              InkWell(
                  onTap: () {
                    router.go('/sign_up');
                  },
                  child: const Text('New to ziyara? Create an Account'))
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formkey,
  });

  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    final email = appState.getLoginEmail;
    final password = appState.getLoginPassword;

    return Container(
      height: 40,
      width: 250,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Set the circular border radius
            ),
          ), // Set the background color
        ),
        onPressed: () {
          if (formkey.currentState!.validate()) {
            print([email, password]);
            authService.logIn(email: email, password: password);
            final user = FirebaseAuth.instance.currentUser;
            print(user);
            //  logIN(emailController, passwordController);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => const HomePage()));
            //print("Validated");
          } else {
            print("Not Validated");
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = false;
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(),
          ),
          child: TextFormField(
            onChanged: (String value) {
              appState.updateLoginPassword(value);
            },
            controller: passwordController,
            obscureText: _isObscure, // Initially obscure password
            decoration: InputDecoration(
              border: InputBorder.none, // Remove the default border
              labelText: 'Password',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              // Add suffix icon to toggle password visibility
              suffixIcon: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure; // Toggle password visibility
                  });
                },
              ),
            ),
            validator: MultiValidator([
              RequiredValidator(errorText: "* Required"),
              MinLengthValidator(6,
                  errorText: "Password should be at least 6 characters"),
              MaxLengthValidator(15,
                  errorText:
                      "Password should not be greater than 15 characters")
            ]),
          )),
    );
  }
}

class EmailField extends StatefulWidget {
  const EmailField({
    super.key,
  });

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  TextEditingController emailController = TextEditingController();

  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(),
        ),
        child: TextFormField(
          onChanged: (String value) {
            appState.updateLoginEmail(value);
          },
          controller: emailController,
          decoration: const InputDecoration(
            // Change the background color

            border: InputBorder.none, // Remove the default border
            labelText: 'Email',
            contentPadding: EdgeInsets.symmetric(
                horizontal: 15, vertical: 10), // Add padding for text
          ),
          validator: MultiValidator([
            RequiredValidator(errorText: "* Required"),
            EmailValidator(errorText: "Enter valid email"),
          ]),
        ),
      ),
    );
  }
}

class ForgotPasswordLabel extends StatelessWidget {
  const ForgotPasswordLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16.0, right: 5),
      child: InkWell(
        onTap: () {},
        child: const Text(
          "Forgot password?",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

class Illustration extends StatelessWidget {
  const Illustration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: SizedBox(
          width: 160,
          height: 160,
          child: ClipOval(
            child: Image.asset(
              'assets/images/illustration.jpg',
              fit: BoxFit
                  .cover, // Ensure the image covers the entire circular area
            ),
          )),
    );
  }
}
