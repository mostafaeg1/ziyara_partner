import 'package:flutter/material.dart';
import 'router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'User Name', // Placeholder text
                    hintText: 'Type something', // Hint text
                    filled: true,
                    fillColor: Colors.grey[200], // Change the background color

                    border: InputBorder.none, // Remove the default border line
                    enabledBorder: OutlineInputBorder(
                      // Specify border when not focused
                      borderSide: BorderSide.none, // No border line
                      borderRadius:
                          BorderRadius.circular(10.0), // Circular shape
                    ),
                    focusedBorder: OutlineInputBorder(
                      // Specify border when focused
                      borderSide: BorderSide.none, // No border line
                      borderRadius:
                          BorderRadius.circular(10.0), // Circular shape
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 380,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password', // Placeholder text
                    filled: true,
                    fillColor: Colors.grey[200], // Change the background color

                    border: InputBorder.none, // Remove the default border line
                    enabledBorder: OutlineInputBorder(
                      // Specify border when not focused
                      borderSide: BorderSide.none, // No border line
                      borderRadius:
                          BorderRadius.circular(10.0), // Circular shape
                    ),
                    focusedBorder: OutlineInputBorder(
                      // Specify border when focused
                      borderSide: BorderSide.none, // No border line
                      borderRadius:
                          BorderRadius.circular(10.0), // Circular shape
                    ),
                  ),
                ),
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
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          7), // Adjust the value to change the roundness
                    ), // Set the background color
                  ),
                  child: const Text(
                    "LOG IN",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
