import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  SigninWithGoogle() async {
    //
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
    // get details from requrest
    final GoogleSignInAuthentication? gauth = await guser!.authentication;

    // credantial for a user
    final credential = GoogleAuthProvider.credential(
      accessToken: gauth!.accessToken,
      idToken: gauth!.idToken,
    );
    // login with google
    return FirebaseAuth.instance.signInWithCredential(credential);
  }
}
