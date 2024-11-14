import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/TextFieldCB.dart';
import '../widgets/my_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //methode de connexion a l'interface
  void signinMethod() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            //Logo
            Image.asset(
              'assets/images/logo.webp',
              width: 200,
            ),
            SizedBox(
              height: 10,
            ),
            //some Text Welcome Back to our ChatyBot
            Text(
              "Welcome To Chatbot",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            TextFieldCB(
              controller: _emailController,
              labelText: "Email",
              obsecureText: false,
            ),
            SizedBox(
              height: 10,
            ),
            //Password textField
            TextFieldCB(
              controller: _passwordController,
              labelText: "mot de passe",
              obsecureText: true,
            ),
            //forget password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: null,
                    child: Text("Mot de passe Oublier?"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //sign in button
            MyButtonSingin(
              onTap: signinMethod,
            ),
            //or continu with
            Text("Ou continer avec"),
            //google + apple sign in buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/apple.png",
                  width: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  "assets/images/google.png",
                  width: 30,
                ),
              ],
            ),
            TextButton(
              onPressed: null,
              child: Text("Cree un compte"),
            ),
          ],
        ),
      ),
    );
  }
}
