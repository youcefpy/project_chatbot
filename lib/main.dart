import 'package:flutter/material.dart';
import 'package:project_chatbot/screens/auth_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyChatBot',
      initialRoute: '/',
      routes: {
        "/": (context) => AuthScreen(),
      },
    );
  }
}
