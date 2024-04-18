import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "router.dart";
import "my_widgets.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                  width: 380,
                  height: 50,
                  child: myTextWidget("Company Name"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 380,
                  height: 50,
                  child: myTextWidget("Email"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 380,
                  height: 50,
                  child: myTextWidget("Password"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 380,
                  height: 50,
                  child: myTextWidget("Password"),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              myButton("Next Confirmation")
            ],
          ),
        ),
      ),
    );
  }
}
