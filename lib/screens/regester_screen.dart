import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/TextFieldCB.dart';
import '../widgets/my_button.dart';
import '../widgets/squareTile.dart';

class RegesterScreen extends StatefulWidget {
  @override
  final Function()? onTap;
  RegesterScreen({required this.onTap});
  State<RegesterScreen> createState() => _RegesterScreen();
}

class _RegesterScreen extends State<RegesterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmePasswordController = TextEditingController();

  //methode de connexion a l'interface
  void signupMethod() async {
    //show loading circule
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (_passwordController.text == _confirmePasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == "wrong-password") {
        //show message email not fount please try again
        showErrorMessage();
      } else {
        print('Error: ${e.message}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void showErrorMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Text(
              "Erreur !",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            content: Text(
              style: TextStyle(
                color: Colors.white,
              ),
              "Erreur dans la connexion, essaye encore une fois",
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            //Logo
            Image.asset(
              'assets/images/logo.webp',
              width: 100,
            ),
            SizedBox(
              height: 10,
            ),
            //some Text Welcome Back to our ChatyBot
            Text(
              "Créer un compte maintenant !",
              style: TextStyle(
                fontSize: 20,
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
            SizedBox(
              height: 10,
            ),
            //confirm password textField
            TextFieldCB(
              controller: _confirmePasswordController,
              labelText: "confirmer le mot de passe",
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

            //sign up button
            MyButtonSingin(
              onTap: signupMethod,
              text: "S'inscrire",
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vous avez un compte',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Se connecter maintenant',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
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
