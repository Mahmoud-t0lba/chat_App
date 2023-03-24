import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Function(String) onTap;

  final String message;
  const CustomTextField(
      {super.key, required this.text, required this.onTap, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

      child: TextFormField(
          onChanged: onTap,
          validator: (value) {
            if (value!.isEmpty) {
              return message;
            }
            return null;
          },
        decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(fontSize: 20, color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
          ),
      );
  }
}
