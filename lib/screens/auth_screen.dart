import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project_chatbot/screens/LoginScreen.dart';
import './home_screen.dart';
import './login_or_regester.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return LoginOrRegester();
            }
          }),
    );
  }
}
