import 'package:flutter/material.dart';

Widget myTextWidget(String text) {
  return TextField(
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
          )));
}

Widget myButton(String text) {
  return ElevatedButton(
    onPressed: () {},
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
