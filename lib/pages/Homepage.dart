import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_demo/services/auth/auth_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child: SafeArea(
          child: Column(
            children: [
              Image.asset('lib/asset/logo.jpg'),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Row(
                  
                  children: [
                   const Text('Signout',style: TextStyle(fontSize: 16),),
                  const SizedBox(
                    width: 5,
                   ),
                    IconButton(onPressed:signOut, icon: const Icon(Icons.logout)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Dev Squad'),
      ),
    );
  }
}
