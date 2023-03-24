// ignore_for_file: file_names

import 'package:chat_app/models/model.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color? color;
  final Message messages;

  const CustomContainer({super.key, this.color, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          color: color ?? Colors.indigo,
        ),
        child: Text(
          messages.message,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
