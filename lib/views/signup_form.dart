import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:provider/provider.dart";
import "package:ziyara_partner/router.dart";

import "../app_state.dart";

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 55),
          child: const Center(child: Text("Create Your Acount")),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formkey,
            child: Column(
              children: [
                const SizedBox(height: 200),
                const EmailField(),
                const PasswordField(),
                const SizedBox(height: 30),
                SignUpButton(formkey: formkey),
              ],
            )),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    TextEditingController emailController = appState.signUpEmailController;
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
            appState.updateSignUpEmail(value);
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

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    TextEditingController passwordController =
        appState.signUpPasswordController;
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
              appState.updateSignUpPassword(value);
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

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.formkey,
  });

  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    final email = appState.getSignupEmail;
    final password = appState.getSignupPassword;

    return Container(
      height: 40,
      width: 375,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
            authService.createUser(email: email, password: password);

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SignUpSuccessDialog();
              },
            );
            //  logIN(emailController, passwordController);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => const HomePage()));
            //print("Validated");
          } else {
            print("Not Validated");
          }
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class SignUpSuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sign Up Successful'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Your account has been successfully created.'),
            Text('You can now log in with your credentials.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
            router.go("/"); // Close the dialog
          },
        ),
      ],
    );
  }
}
