import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;

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
      }
    } catch (e) {
      log('Error during Google sign in: ${e.toString()}');
    }
    return user;
  }

  Future googleSignupRequst(User user) async {
    Map<String, dynamic> req = {
      "email": user.email,
      "name": user.displayName,
      "profilePic": user.photoURL
    };
    final response = await http.post(
      Uri.parse(Apis.googleSignUp),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(req),
    );
    final responseBody = jsonDecode(response.body);
    print(responseBody);
    if (response.statusCode == 200) {
      print(responseBody['accessToken']);
      saveJWStocken(responseBody['accessToken']);
      return responseBody;
    } else {
      return responseBody["message"];
    }
  }
}
