import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_demo/services/auth/login_or_register.dart';

import '../../pages/Homepage.dart';

class AuteGate extends StatelessWidget {
  const AuteGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Homepage();
            } else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
