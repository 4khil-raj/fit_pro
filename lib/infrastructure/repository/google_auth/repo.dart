import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final auth = FirebaseAuth.instance;
  Future<User?> signUpWithGoogle() async {
    User? user;
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final creds = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final userCredential = await auth.signInWithCredential(creds);
        user = userCredential.user;

        // print(userCredential.credential!.);
        print("===================================+++++++");
      }
    } catch (e) {
      print('Error during Google sign in: ${e.toString()}');
    }
    return user;
  }
}
