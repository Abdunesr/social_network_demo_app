import 'package:flutter/material.dart';
import 'package:social_media_demo/componets/My_text_Field.dart';
import 'package:social_media_demo/componets/my_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Icon(
                  Icons.message,
                  size: 80,
                  color: Colors.grey[800],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Welcome back you have been missed",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 25,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(
                  height: 25,
                ),
                MyButton(onTap: () {}, text: "Sign In    ")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
