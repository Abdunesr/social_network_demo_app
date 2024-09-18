import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_demo/services/auth/auth_service.dart';

import '../componets/My_text_Field.dart';
import '../componets/my_button.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  void signUp() async {
    if (passwordController.text != confirmpasswordController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Password doesnt match')));
      return;
    } else {
      final authservice = Provider.of<AuthService>(context, listen: false);
      try {
        await authservice.signUpwithEmailandPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                    width: double.infinity,
                  ),
                  Container(
                    width: 200, // Set the width to the desired size
                    height: 200, // Set the height to the same value as width
                    decoration: const BoxDecoration(
                      shape: BoxShape
                          .circle, // This ensures the container itself is circular
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'lib/asset/logo.jpg',
                        fit: BoxFit
                            .cover, // Ensures the image covers the entire circular area
                      ),
                    ),
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
                    height: 10,
                  ),
                  MyTextField(
                      controller: confirmpasswordController,
                      hintText: 'Confirm password',
                      obscureText: true),
                  const SizedBox(
                    height: 25,
                  ),
                  MyButton(onTap: signUp, text: "Sign up "),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have ?"),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Log in',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
