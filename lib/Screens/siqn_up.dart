import 'package:chat_app/Screens/chat.dart';
import 'package:chat_app/Screens/sign_in.dart';
import 'package:chat_app/res.dart';
import 'package:chat_app/widget/my_text.dart';
import 'package:chat_app/widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widget/button.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  String email = "";
  String password = "";
  Future<void> registerUser(context) async {
    final credential1 =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential1.user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatApp()),
      );
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
              const MyText(
                title: 'Sign Up',
                fontSize: 27,
                margin: EdgeInsets.only(right: 260, top: 60),
              ),
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
                child: const CustomButton(text: "Sign Up"),
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await registerUser(context);
                    } on FirebaseAuthException catch (e) {
                      SnackBar snackBar = SnackBar(
                        content: Text(e.message.toString()),
                        backgroundColor: Colors.black,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    " Already have account?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text(
                      "Sign in ",
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
