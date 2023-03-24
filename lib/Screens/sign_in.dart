import 'package:chat_app/Screens/chat.dart';
import 'package:chat_app/Widget/button.dart';
import 'package:chat_app/res.dart';
import 'package:chat_app/widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'siqn_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = "";
  String password = "";
  Future<void> login(context) async {
    final credential1 = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (credential1.user != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ChatApp()),
          (route) => false);
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 100, left: 20),
                  child: Image.asset(
                    Res.dawnlad,
                    width: 300,
                  )),
              Container(
                margin: const EdgeInsets.only(left: 30, top: 20),
                child: const Text(
                  "Scholar Chat",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black87,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(right: 260, top: 60),
                  child: const Text(
                    "Sign In ",
                    style: TextStyle(fontSize: 27),
                  )),
              CustomTextField(
                  onTap: (value) => email = value,
                  text: 'Email',
                  message: '"email is not valid"'),
              CustomTextField(
                onTap: (value) {
                  password = value;
                },
                text: "Password",
                message: 'pass is not valid',
              ),
              InkWell(
                child: const CustomButton(text: "Sign IN"),
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await login(context);
                    } on FirebaseAuthException catch (e) {
                      SnackBar snackBar = SnackBar(
                        content: Text(e.message.toString()),
                        backgroundColor: Colors.black,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    isLoading = false;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have account?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Sign()),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
