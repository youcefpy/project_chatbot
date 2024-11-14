import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void myLogout() async {
      await FirebaseAuth.instance.signOut();
    }

    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: myLogout,
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: Text("Welcome  ${user!.email} to Askfy"),
      ),
    );
  }
}
