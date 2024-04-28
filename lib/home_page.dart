import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ziyara_partner/app_state.dart';
import 'package:ziyara_partner/my_widgets.dart';
import 'router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    TextEditingController password_controller = TextEditingController();
    TextEditingController email_controller = TextEditingController();

    return Scaffold(
        backgroundColor:
            Colors.white, // Set the background color of this Scaffold

        body: SingleChildScrollView(
          // Enable shrinkWrap to size ListView based on its children
          child: Column(
            children: [
              Image.asset("assets/illustration.jpg"),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                "Welcome to zeyara",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )),
              const SizedBox(height: 40),
              Container(
                  width: 380,
                  child:
                      myTextWidget("Email", textController: email_controller)),
              const SizedBox(height: 30),
              SizedBox(
                width: 380,
                child: myTextWidget("Password",
                    textController: password_controller),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                      left: 20, top: 10), // Adjust the value as needed

                  child: const Text("Forgot Password?")),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Dont have an account?"),
                TextButton(
                    onPressed: () {
                      router.go('/sign_up');
                    },
                    child: const Text("SIGN UP"))
              ]),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: 380,
                  height: 50,
                  child: logInButton("Log In", context)),
            ],
          ),
        ));
  }
}
