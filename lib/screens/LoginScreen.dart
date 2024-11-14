import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/TextFieldCB.dart';
import '../widgets/my_button.dart';
import '../widgets/squareTile.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //methode de connexion a l'interface
  void signinMethod() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Error: ${e.message}');
      }
    } catch (e) {
      // Handle any other error
      print('Error: $e');
    }
  }

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
              "Welcome To Askify",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
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

            //sign in button
            MyButtonSingin(
              onTap: signinMethod,
            ),
            const SizedBox(height: 50),
            //or continu with
            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Ou continue Avec',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),

            //google + apple sign in buttons

            // google + apple sign in buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // google button
                SquareTile(imagePath: 'assets/images/google.png'),

                SizedBox(width: 25),

                // apple button
                SquareTile(imagePath: 'assets/images/apple.png')
              ],
            ),

            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
