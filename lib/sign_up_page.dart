import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";
import "package:ziyara_partner/app_state.dart";
import "package:ziyara_partner/services/auth/auth.dart";

import "router.dart";
import "my_widgets.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    TextEditingController password_controller = appState.signUpPasswordController;
    TextEditingController email_controller = appState.signUpEmailController;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: PopScope(
        canPop: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Create Your Acount",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                  width: 380,
                  height: 50,
                  child: myTextWidget("Company Name"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 380,
                  height: 50,
                  child:
                      myTextWidget("Email", textController: email_controller),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 380,
                  height: 50,
                  child: myTextWidget("Password",
                      textController: password_controller),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Center(
              //   child: SizedBox(
              //     width: 380,
              //     height: 50,
              //     child: myTextWidget("Password", textController: password_controller),
              //   ),
              // ),
              const SizedBox(
                height: 40,
              ),
              signUpButton("Next Confirmation", context)
            ],
          ),
        ),
      ),
    );
  }
}
