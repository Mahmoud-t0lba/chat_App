import 'package:flutter/material.dart';

AppBar get appBar {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Text(
      "Chat",
      style: TextStyle(
        fontSize: 30,
        color: Colors.indigo.shade900,
      ),
    ),
    centerTitle: true,
  );
}
