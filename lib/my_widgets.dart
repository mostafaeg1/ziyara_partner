import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ziyara_partner/app_state.dart';
import 'package:ziyara_partner/services/auth/auth.dart';

Widget myTextWidget(String text, {TextEditingController? textController}) {
  return TextField(
    controller: textController, // Use textController instead of textControler
    decoration: InputDecoration(
      labelText: text, // Placeholder text
      filled: true,
      fillColor: Colors.grey[200], // Change the background color
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
  );
}

Widget myButton(String text,BuildContext  context,Future<void> Function() onPressed(TextEditingController email_controller,TextEditingController password_controller)) {
      var appState = Provider.of<AppState>(context);
  TextEditingController password_controller = appState.signUpPasswordController;
    TextEditingController email_controller = appState.signUpEmailController;
  return ElevatedButton(
    onPressed: onPressed(email_controller, password_controller),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            7), // Adjust the value to change the roundness
      ), // Set the background color
    ),
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 15),
    ),
  );
}


Widget signUpButton(String text,BuildContext  context) {
      var appState = Provider.of<AppState>(context);
  TextEditingController password_controller = appState.signUpPasswordController;
    TextEditingController email_controller = appState.signUpEmailController;
  return ElevatedButton(
    onPressed: (){signUp(email_controller, password_controller);},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            7), // Adjust the value to change the roundness
      ), // Set the background color
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 15),
    ),
  );
}


Widget  logInButton(String text,BuildContext  context) {
      var appState = Provider.of<AppState>(context);
  TextEditingController password_controller = appState.signUpPasswordController;
    TextEditingController email_controller = appState.signUpEmailController;
  return ElevatedButton(
    onPressed: (){logIN(email_controller, password_controller);},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            7), // Adjust the value to change the roundness
      ), // Set the background color
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 15),
    ),
  );
}

