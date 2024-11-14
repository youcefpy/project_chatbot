import 'package:flutter/material.dart';
import 'package:project_chatbot/screens/LoginScreen.dart';
import './regester_screen.dart';

class LoginOrRegester extends StatefulWidget {
  const LoginOrRegester({super.key});

  @override
  State<LoginOrRegester> createState() => _LoginOrRegesterState();
}

class _LoginOrRegesterState extends State<LoginOrRegester> {
  //show login page
  bool showLoginScreen = true;

  //toggle between login and register
  void toggleLoginRester() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(onTap: toggleLoginRester);
    } else {
      return RegesterScreen(onTap: toggleLoginRester);
    }
  }
}
