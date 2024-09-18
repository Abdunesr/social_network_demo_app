import 'package:social_media_demo/pages/login_page.dart';
import 'package:social_media_demo/pages/register.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool istoggle = false;
  void toggle() {
    setState(() {
      istoggle = !istoggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (istoggle) {
      return LoginPage(ontap: toggle);
    } else {
      return Register(onTap: toggle);
    }
  }
}
