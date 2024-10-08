import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_demo/firebase_options.dart';
import 'package:social_media_demo/services/auth/aute_gate.dart';
import 'package:social_media_demo/services/auth/auth_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    
   ChangeNotifierProvider(create: (context)=>AuthService(),
   child: const MyApp(),
   )
    
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuteGate(),
    );
  }
}
