import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set the background color of this Scaffold

      body: ListView(
        // Enable shrinkWrap to size ListView based on its children

        children: [
          Image.asset("assets/illustration.jpg"),
          const Center(
              child: Text(
            "Welcome",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          )),
          const SizedBox(height: 40),
          SizedBox(
            width: 380,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'User Name', // Placeholder text
                hintText: 'Type something', // Hint text
                filled: true,
                border: InputBorder.none, // Remove the default border line
                contentPadding: EdgeInsets.all(16), // Adjust padding as needed
                enabledBorder: OutlineInputBorder(
                  // Specify border when not focused
                  borderSide: BorderSide.none, // No border line
                  borderRadius: BorderRadius.circular(10.0), // Circular shape
                ),
                focusedBorder: OutlineInputBorder(
                  // Specify border when focused
                  borderSide: BorderSide.none, // No border line
                  borderRadius: BorderRadius.circular(10.0), // Circular shape
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 100,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'User Name', // Placeholder text
                filled: true,
                border: InputBorder.none, // Remove the default border line
                enabledBorder: OutlineInputBorder(
                  // Specify border when not focused
                  borderSide: BorderSide.none, // No border line
                  borderRadius: BorderRadius.circular(10.0), // Circular shape
                ),
                focusedBorder: OutlineInputBorder(
                  // Specify border when focused
                  borderSide: BorderSide.none, // No border line
                  borderRadius: BorderRadius.circular(10.0), // Circular shape
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Log in",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      7), // Adjust the value to change the roundness
                ), // Set the background color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
