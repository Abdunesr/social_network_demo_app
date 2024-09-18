import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_demo/componets/My_text_Field.dart';
import 'package:social_media_demo/componets/my_button.dart';
import 'package:social_media_demo/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.ontap});
  final void Function()? ontap;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authservice = Provider.of<AuthService>(context, listen: false);

    try {
      await authservice.signInwithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  height: 25,
                ),
                MyButton(onTap: signIn, text: "Sign In "),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?"),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: const Text(
                        'Register now',
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
    );
  }
}
